/* markupreader.vala
 *
 * Copyright (C) 2008-2009  Jürg Billeter
 * Copyright (C) 2011       Florian Brosch
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
 * Author:
 * 	Jürg Billeter <j@bitron.ch>
 */

using GLib;
using Gee;


/**
 * Simple reader for a subset of XML.
 */
public class Valadoc.MarkupReader : Object {
	public string filename {
		private set;
		get;
	}

	public string name {
		private set;
		get;
	}

	public string content {
		private set;
		get;
	}

	private MappedFile mapped_file;

	private string[] lines;
	private char* begin;
	private char* current;
	private char* end;

	private int line;
	private int column;

	private Map<string, string> attributes = new HashMap<string, string> (str_hash, str_equal);
	private bool empty_element;

	private ErrorReporter reporter;

	public MarkupReader.from_string (string filename, string content, ErrorReporter reporter) {
		this.filename = filename;
		this.reporter = reporter;

		lines = content.split ("\n");
		begin = content;
		end = begin + content.size ();
		current = begin;

		column = 1;
		line = 1;
	}

	public MarkupReader (string filename, ErrorReporter reporter) {
		this.filename = filename;
		this.reporter = reporter;

		try {
			mapped_file = new MappedFile (filename, false);
			begin = mapped_file.get_contents ();
			lines = ((string) begin).split ("\n");
			end = begin + mapped_file.get_length ();

			current = begin;

			line = 1;
			column = 1;
		} catch (FileError e) {
			reporter.simple_error ("%s: error: Unable to map file: %s", filename, e.message);
		}
	}

	public string? get_line_content (int line_nr) {
		if (this.lines.length > line_nr) {
			return this.lines[line_nr];
		}

		return null;
	}

	public string? get_attribute (string attr) {
		return attributes[attr];
	}

	/*
	 * Returns a copy of the current attributes.
	 *
	 * @return map of current attributes
	 */
	public Map<string,string> get_attributes () {
		var result = new HashMap<string,string> (str_hash, str_equal);
		foreach (var key in attributes.keys) {
			result.set (key, attributes.get (key));
		}
		return result;
	}

	private string read_name () {
		char* begin = current;
		while (current < end) {
			if (current[0] == ' ' || current[0] == '\t' || current[0] == '>'
			    || current[0] == '/' || current[0] == '=' || current[0] == '\n') {
				break;
			}
			unichar u = ((string) current).get_char_validated ((long) (end - current));
			if (u != (unichar) (-1)) {
				current += u.to_utf8 (null);
			} else {
				reporter.simple_error ("%s:%d: error: invalid UTF-8 character", filename, line);
			}
		}
		if (current == begin) {
			// syntax error: invalid name
		}
		return ((string) begin).substring (0, (int) (current - begin));
	}

	public MarkupTokenType read_token (out MarkupSourceLocation token_begin, out MarkupSourceLocation token_end) {
		attributes.clear ();

		if (empty_element) {
			empty_element = false;
			token_begin = MarkupSourceLocation (begin, line, column);
			token_end = MarkupSourceLocation (begin, line, column);
			return MarkupTokenType.END_ELEMENT;
		}

		space ();

		MarkupTokenType type = MarkupTokenType.NONE;
		char* begin = current;
		token_begin = MarkupSourceLocation (begin, line, column);

		if (current >= end) {
			type = MarkupTokenType.EOF;
		} else if (current[0] == '<') {
			current++;
			if (current >= end) {
				// error
			} else if (current[0] == '?') {
				// processing instruction
			} else if (current[0] == '!') {
				// comment or doctype
				current++;
				if (current < end - 1 && current[0] == '-' && current[1] == '-') {
					// comment
					current += 2;
					while (current < end - 2) {
						if (current[0] == '-' && current[1] == '-' && current[2] == '>') {
							// end of comment
							current += 3;
							break;
						} else if (current[0] == '\n') {
							line++;
							column = 0;
						}
						current++;
					}

					// ignore comment, read next token
					return read_token (out token_begin, out token_end);
				}
			} else if (current[0] == '/') {
				type = MarkupTokenType.END_ELEMENT;
				current++;
				name = read_name ();
				if (current >= end || current[0] != '>') {
					// error
				}
				current++;
			} else {
				type = MarkupTokenType.START_ELEMENT;
				name = read_name ();
				space ();
				while (current < end && current[0] != '>' && current[0] != '/') {
					string attr_name = read_name ();
					if (current >= end || current[0] != '=') {
						// error
					}
					current++;
					// FIXME allow single quotes
					if (current >= end || current[0] != '"') {
						// error
					}
					current++;

					string attr_value = text ('"', false);

					if (current >= end || current[0] != '"') {
						// error
					}
					current++;
					attributes.set (attr_name, attr_value);
					space ();
				}
				if (current[0] == '/') {
					empty_element = true;
					current++;
					space ();
				} else {
					empty_element = false;
				}
				if (current >= end || current[0] != '>') {
					// error
				}
				current++;
			}
		} else {
			space ();

			if (current[0] != '<') {
				content = text ('<', true);
			} else {
				// no text
				// read next token
				return read_token (out token_begin, out token_end);
			}

			type = MarkupTokenType.TEXT;
		}

		token_end = MarkupSourceLocation (current, line, column - 1);

		return type;
	}

	private string text (char end_char, bool rm_trailing_whitespace) {
		StringBuilder content = new StringBuilder ();
		char* text_begin = current;
		char* last_linebreak = current;

		while (current < end && current[0] != end_char) {
			unichar u = ((string) current).get_char_validated ((long) (end - current));
			if (u == (unichar) (-1)) {
				reporter.simple_error ("%s:%d: error: invalid UTF-8 character", filename, line);
			} else if (u == '&') {
				char* next_pos = current + u.to_utf8 (null);
				if (((string) next_pos).has_prefix ("amp;")) {
					content.append (((string) text_begin).substring (0, (int) (current - text_begin)));
					content.append_c ('&');
					current += 5;
					text_begin = current;
				} else if (((string) next_pos).has_prefix ("quot;")) {
					content.append (((string) text_begin).substring (0, (int) (current - text_begin)));
					content.append_c ('"');
					current += 6;
					text_begin = current;
				} else if (((string) next_pos).has_prefix ("apos;")) {
					content.append (((string) text_begin).substring (0, (int) (current - text_begin)));
					content.append_c ('\'');
					current += 6;
					text_begin = current;
				} else if (((string) next_pos).has_prefix ("lt;")) {
					content.append (((string) text_begin).substring (0, (int) (current - text_begin)));
					content.append_c ('<');
					current += 4;
					text_begin = current;
				} else if (((string) next_pos).has_prefix ("gt;")) {
					content.append (((string) text_begin).substring (0, (int) (current - text_begin)));
					content.append_c ('>');
					current += 4;
					text_begin = current;
				} else if (((string) next_pos).has_prefix ("percnt;")) {
					content.append (((string) text_begin).substring (0, (int) (current - text_begin)));
					content.append_c ('>');
					current += 8;
					text_begin = current;
				} else {
					current += u.to_utf8 (null);
				}
			} else {
				if (u == '\n') {
					line++;
					column = 0;
					last_linebreak = current;
				}

				current += u.to_utf8 (null);
				column++;
			}
		}

		if (text_begin != current) {
			content.append (((string) text_begin).substring (0, (int) (current - text_begin)));
		}

		column += (int) (current - last_linebreak);

		// Removes trailing whitespace
		if (rm_trailing_whitespace) {
			char* str_pos = ((char*)content.str) + content.len;
			for (str_pos--; str_pos > ((char*)content.str) && str_pos[0].isspace(); str_pos--);
			content.erase ((ssize_t) (str_pos-((char*) content.str) + 1), -1);
		}

		return content.str;
	}

	private void space () {
		while (current < end && current[0].isspace ()) {
			if (current[0] == '\n') {
				line++;
				column = 0;
			}
			current++;
			column++;
		}
	}
}


