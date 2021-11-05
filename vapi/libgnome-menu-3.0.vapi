/* libgnome-menu-3.0.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "GMenu", gir_namespace = "GMenu", gir_version = "3.0", lower_case_cprefix = "gmenu_")]
namespace GMenu {
	[CCode (cheader_filename = "gmenu-tree.h", type_id = "gmenu_tree_get_type ()")]
	public class Tree : GLib.Object {
		[CCode (has_construct_function = false)]
		public Tree (string menu_basename, GMenu.TreeFlags flags);
		[CCode (has_construct_function = false)]
		public Tree.for_path (string menu_path, GMenu.TreeFlags flags);
		public unowned string get_canonical_menu_path ();
		public GMenu.TreeDirectory get_directory_from_path (string path);
		public GMenu.TreeEntry get_entry_by_id (string id);
		public GMenu.TreeDirectory get_root_directory ();
		public static void* item_ref (void* item);
		public static void item_unref (void* item);
		public bool load_sync () throws GLib.Error;
		[NoAccessorMethod]
		public GMenu.TreeFlags flags { get; construct; }
		[NoAccessorMethod]
		public string menu_basename { owned get; construct; }
		[NoAccessorMethod]
		public string menu_path { owned get; construct; }
		public signal void changed ();
	}
	[CCode (cheader_filename = "gmenu-tree.h", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "gmenu_tree_alias_get_type ()")]
	[Compact]
	public class TreeAlias {
		public GMenu.TreeDirectory get_aliased_directory ();
		public GMenu.TreeEntry get_aliased_entry ();
		public GMenu.TreeItemType get_aliased_item_type ();
		public GMenu.TreeDirectory get_directory ();
		public GMenu.TreeDirectory get_parent ();
		public GMenu.Tree get_tree ();
	}
	[CCode (cheader_filename = "gmenu-tree.h", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "gmenu_tree_directory_get_type ()")]
	[Compact]
	public class TreeDirectory {
		public unowned string get_comment ();
		public unowned string get_desktop_file_path ();
		public unowned string get_generic_name ();
		public unowned GLib.Icon get_icon ();
		public bool get_is_nodisplay ();
		public unowned string get_menu_id ();
		public unowned string get_name ();
		public GMenu.TreeDirectory get_parent ();
		public GMenu.Tree get_tree ();
		public GMenu.TreeIter iter ();
		public string make_path (GMenu.TreeEntry entry);
	}
	[CCode (cheader_filename = "gmenu-tree.h", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "gmenu_tree_entry_get_type ()")]
	[Compact]
	public class TreeEntry {
		public unowned GLib.DesktopAppInfo get_app_info ();
		public unowned string get_desktop_file_id ();
		public unowned string get_desktop_file_path ();
		public bool get_is_excluded ();
		public bool get_is_nodisplay_recurse ();
		public bool get_is_unallocated ();
		public GMenu.TreeDirectory get_parent ();
		public GMenu.Tree get_tree ();
	}
	[CCode (cheader_filename = "gmenu-tree.h", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "gmenu_tree_header_get_type ()")]
	[Compact]
	public class TreeHeader {
		public GMenu.TreeDirectory get_directory ();
		public GMenu.TreeDirectory get_parent ();
		public GMenu.Tree get_tree ();
	}
	[CCode (cheader_filename = "gmenu-tree.h", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "gmenu_tree_iter_get_type ()")]
	[Compact]
	public class TreeIter {
		public GMenu.TreeAlias get_alias ();
		public GMenu.TreeDirectory get_directory ();
		public GMenu.TreeEntry get_entry ();
		public GMenu.TreeHeader get_header ();
		public GMenu.TreeSeparator get_separator ();
		public GMenu.TreeItemType next ();
	}
	[CCode (cheader_filename = "gmenu-tree.h", copy_function = "g_boxed_copy", free_function = "g_boxed_free", type_id = "gmenu_tree_separator_get_type ()")]
	[Compact]
	public class TreeSeparator {
		public GMenu.TreeDirectory get_parent ();
		public GMenu.Tree get_tree ();
	}
	[CCode (cheader_filename = "gmenu-tree.h", cprefix = "GMENU_TREE_FLAGS_", type_id = "gmenu_tree_flags_get_type ()")]
	[Flags]
	public enum TreeFlags {
		NONE,
		INCLUDE_EXCLUDED,
		SHOW_EMPTY,
		INCLUDE_NODISPLAY,
		SHOW_ALL_SEPARATORS,
		SORT_DISPLAY_NAME,
		INCLUDE_UNALLOCATED
	}
	[CCode (cheader_filename = "gmenu-tree.h", cprefix = "GMENU_TREE_ITEM_", has_type_id = false)]
	public enum TreeItemType {
		INVALID,
		DIRECTORY,
		ENTRY,
		SEPARATOR,
		HEADER,
		ALIAS
	}
}
