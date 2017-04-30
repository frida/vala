/* valaccodeexpressionstatement.vala
 *
 * Copyright (C) 2006-2008  Jürg Billeter
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
 * Author:
 * 	Jürg Billeter <j@bitron.ch>
 */

using GLib;

/**
 * Represents a C code statement that evaluates a given expression.
 */
public class Vala.CCodeExpressionStatement : CCodeStatement {
	/**
	 * The expression to evaluate.
	 */
	public CCodeExpression expression { get; set; }

	/**
	 * Preprocessor define to optionally put this expression behind.
	 */
	public string? ifdef { get; set; }

	public CCodeExpressionStatement (CCodeExpression expr) {
		expression = expr;
	}

	public CCodeExpressionStatement.behind_ifdef (string idef, CCodeExpression expr) {
		expression = expr;
		ifdef = idef;
	}

	public override void write (CCodeWriter writer) {
		if (ifdef != null) {
			writer.write_string ("#ifdef ");
			writer.write_string (ifdef);
			writer.write_newline ();
		}

		if (expression is CCodeCommaExpression) {
			// expand comma expression into multiple statements
			// to improve code readability
			var ccomma = expression as CCodeCommaExpression;

			foreach (CCodeExpression expr in ccomma.get_inner ()) {
				write_expression (writer, expr);
			}
		} else if (expression is CCodeParenthesizedExpression) {
			var cpar = expression as CCodeParenthesizedExpression;

			write_expression (writer, cpar.inner);
		} else {
			write_expression (writer, expression);
		}

		if (ifdef != null) {
			writer.write_string ("#endif");
			writer.write_newline ();
		}
	}

	private void write_expression (CCodeWriter writer, CCodeExpression? expr) {
		writer.write_indent (line);
		if (expr != null) {
			expr.write (writer);
		}
		writer.write_string (";");
		writer.write_newline ();
	}
}
