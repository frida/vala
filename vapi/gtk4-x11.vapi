/* gtk4-x11.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "Gdk", gir_namespace = "GdkX11", gir_version = "4.0", lower_case_cprefix = "gdk_")]
namespace Gdk {
	namespace X11 {
		[CCode (cheader_filename = "gdk/x11/gdkx.h", type_id = "gdk_x11_app_launch_context_get_type ()")]
		[GIR (name = "X11AppLaunchContext")]
		public sealed class AppLaunchContext : Gdk.AppLaunchContext {
			[CCode (has_construct_function = false)]
			protected AppLaunchContext ();
		}
		[CCode (cheader_filename = "gdk/x11/gdkx.h", type_id = "gdk_x11_device_manager_xi2_get_type ()")]
		[GIR (name = "X11DeviceManagerXI2")]
		public sealed class DeviceManagerXI2 : GLib.Object {
			[CCode (has_construct_function = false)]
			protected DeviceManagerXI2 ();
			[CCode (cheader_filename = "gdk/x11/gdkx.h", cname = "gdk_x11_device_manager_lookup")]
			public unowned Gdk.X11.DeviceXI2? lookup_for_device_manager (int device_id);
			[NoAccessorMethod]
			public Gdk.Display display { owned get; construct; }
			[NoAccessorMethod]
			public int major { get; construct; }
			[NoAccessorMethod]
			public int minor { get; construct; }
			[NoAccessorMethod]
			public int opcode { get; construct; }
		}
		[CCode (cheader_filename = "gdk/x11/gdkx.h", type_id = "gdk_x11_device_xi2_get_type ()")]
		[GIR (name = "X11DeviceXI2")]
		public sealed class DeviceXI2 : Gdk.Device {
			[CCode (has_construct_function = false)]
			protected DeviceXI2 ();
			[CCode (cheader_filename = "gdk/x11/gdkx.h", cname = "gdk_x11_device_get_id")]
			public int get_id ();
			[NoAccessorMethod]
			public int device_id { get; construct; }
		}
		[CCode (cheader_filename = "gdk/x11/gdkx.h", type_id = "gdk_x11_display_get_type ()")]
		[GIR (name = "X11Display")]
		public sealed class Display : Gdk.Display {
			[CCode (has_construct_function = false)]
			protected Display ();
			public void broadcast_startup_message (string message_type, ...);
			public int error_trap_pop ();
			public void error_trap_pop_ignored ();
			public void error_trap_push ();
			public unowned Gdk.Surface get_default_group ();
			[Version (since = "4.4")]
			public void* get_egl_display ();
			[Version (since = "4.4")]
			public bool get_egl_version (out int major, out int minor);
			public bool get_glx_version (out int major, out int minor);
			public unowned Gdk.Monitor get_primary_monitor ();
			public unowned Gdk.X11.Screen get_screen ();
			[Version (deprecated = true, deprecated_since = "4.10")]
			public unowned string get_startup_notification_id ();
			public uint32 get_user_time ();
			[CCode (cheader_filename = "gdk/x11/gdkx.h", cname = "gdk_x11_get_xatom_by_name_for_display")]
			public X.Atom get_xatom_by_name (string atom_name);
			[CCode (cheader_filename = "gdk/x11/gdkx.h", cname = "gdk_x11_get_xatom_name_for_display")]
			public unowned string get_xatom_name (X.Atom xatom);
			public X.Cursor get_xcursor (Gdk.Cursor cursor);
			public unowned X.Display get_xdisplay ();
			public X.Window get_xrootwindow ();
			public unowned X.Screen get_xscreen ();
			public void grab ();
			[CCode (cheader_filename = "gdk/x11/gdkx.h", cname = "gdk_x11_lookup_xdisplay")]
			public static unowned Gdk.X11.Display lookup_for_xdisplay (X.Display xdisplay);
			public static Gdk.Display? open (string? display_name);
			public void set_cursor_theme (string? theme, int size);
			public static void set_program_class (Gdk.Display display, string program_class);
			[Version (deprecated = true, deprecated_since = "4.10")]
			public void set_startup_notification_id (string startup_id);
			public void set_surface_scale (int scale);
			public int string_to_compound_text (string str, out unowned string encoding, out int format, [CCode (array_length_cname = "length", array_length_pos = 4.1)] out uint8[] ctext);
			public int text_property_to_text_list (string encoding, int format, [CCode (type = "const guchar*")] string text, int length, [CCode (array_length = false, type = "char***")] out string[] list);
			public void ungrab ();
			public bool utf8_to_compound_text (string str, out unowned string encoding, out int format, [CCode (array_length_cname = "length", array_length_pos = 4.1)] out uint8[] ctext);
			public signal bool xevent ([CCode (type = "gpointer")] X.Event xevent);
		}
		[CCode (cheader_filename = "gdk/x11/gdkx.h", type_id = "gdk_x11_drag_get_type ()")]
		[GIR (name = "X11Drag")]
		public sealed class Drag : Gdk.Drag {
			[CCode (has_construct_function = false)]
			protected Drag ();
		}
		[CCode (cheader_filename = "gdk/x11/gdkx.h", type_id = "gdk_x11_gl_context_get_type ()")]
		[GIR (name = "X11GLContext")]
		public abstract class GLContext : Gdk.GLContext {
			[CCode (has_construct_function = false)]
			protected GLContext ();
		}
		[CCode (cheader_filename = "gdk/x11/gdkx.h", type_id = "gdk_x11_monitor_get_type ()")]
		[GIR (name = "X11Monitor")]
		public sealed class Monitor : Gdk.Monitor {
			[CCode (has_construct_function = false)]
			protected Monitor ();
			public X.ID get_output ();
			public Gdk.Rectangle get_workarea ();
		}
		[CCode (cheader_filename = "gdk/x11/gdkx.h", type_id = "gdk_x11_screen_get_type ()")]
		[GIR (name = "X11Screen")]
		public sealed class Screen : GLib.Object {
			[CCode (has_construct_function = false)]
			protected Screen ();
			public uint32 get_current_desktop ();
			public X.ID get_monitor_output (int monitor_num);
			public uint32 get_number_of_desktops ();
			public int get_screen_number ();
			public unowned string get_window_manager_name ();
			public unowned X.Screen get_xscreen ();
			public bool supports_net_wm_hint (string property_name);
			public signal void window_manager_changed ();
		}
		[CCode (cheader_filename = "gdk/x11/gdkx.h", type_id = "gdk_x11_surface_get_type ()")]
		[GIR (name = "X11Surface")]
		public sealed class Surface : Gdk.Surface {
			[CCode (has_construct_function = false)]
			protected Surface ();
			public uint32 get_desktop ();
			public unowned Gdk.Surface? get_group ();
			[CCode (cheader_filename = "gdk/x11/gdkx.h", cname = "gdk_x11_get_server_time")]
			public uint32 get_server_time ();
			public X.Window get_xid ();
			public static unowned Gdk.X11.Surface lookup_for_display (Gdk.X11.Display display, X.Window window);
			public void move_to_current_desktop ();
			public void move_to_desktop (uint32 desktop);
			public void set_frame_sync_enabled (bool frame_sync_enabled);
			public void set_group (Gdk.Surface leader);
			public void set_skip_pager_hint (bool skips_pager);
			public void set_skip_taskbar_hint (bool skips_taskbar);
			public void set_theme_variant (string variant);
			public void set_urgency_hint (bool urgent);
			public void set_user_time (uint32 timestamp);
			public void set_utf8_property (string name, string? value);
		}
		[CCode (cheader_filename = "gdk/x11/gdkx.h", cprefix = "GDK_X11_DEVICE_TYPE_", has_type_id = false)]
		[GIR (name = "X11DeviceType")]
		public enum DeviceType {
			LOGICAL,
			PHYSICAL,
			FLOATING
		}
		[CCode (cheader_filename = "gdk/x11/gdkx.h")]
		public static void free_compound_text ([CCode (array_length = false, type = "guchar*")] owned uint8[] ctext);
		[CCode (cheader_filename = "gdk/x11/gdkx.h")]
		public static void free_text_list ([CCode (array_length = false, type = "char**")] owned string[] list);
		[CCode (cheader_filename = "gdk/x11/gdkx.h")]
		public static void set_sm_client_id (string? sm_client_id);
	}
}