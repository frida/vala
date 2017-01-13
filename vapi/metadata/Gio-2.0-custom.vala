namespace GLib {
	[CCode (cheader_filename = "glib.h", cname = "g_realloc")]
	public static GLib.ReallocFunc g_realloc;

	[CCode (cheader_filename = "gio/gio.h")]
	namespace Bus {
		public async GLib.DBusConnection get (GLib.BusType bus_type, GLib.Cancellable? cancellable = null) throws GLib.IOError;
		public GLib.DBusConnection get_sync (GLib.BusType bus_type, GLib.Cancellable? cancellable = null) throws GLib.IOError;
		public async T get_proxy<T> (GLib.BusType bus_type, string name, string object_path, GLib.DBusProxyFlags flags = 0, GLib.Cancellable? cancellable = null) throws GLib.IOError;
		public T get_proxy_sync<T> (GLib.BusType bus_type, string name, string object_path, GLib.DBusProxyFlags flags = 0, GLib.Cancellable? cancellable = null) throws GLib.IOError;
	}

	public struct ActionEntry {
		public weak string name;
		[Version (deprecated = true, deprecated_since = "vala-0.26", replacement = "activate_callback")]
		public GLib.SimpleActionActivateCallback? activate;
		public weak string parameter_type;
		public weak string state;
		[Version (deprecated_since = "vala-0.26", replacement = "change_state_callback")]
		public GLib.SimpleActionChangeStateCallback? change_state;
		[CCode (cname = "activate")]
		public GLib.SimpleActionActivateFunc activate_callback;
		[CCode (cname = "change_state")]
		public GLib.SimpleActionChangeStateFunc? change_state_callback;
	}

	[Compact]
	[CCode (cname = "GSource", ref_function = "g_source_ref", unref_function = "g_source_unref")]
	public class CancellableSource : GLib.Source {
		[CCode (cname = "g_source_set_callback")]
		public void set_callback ([CCode (type = "GSourceFunc")] owned CancellableSourceFunc func);
	}

	[CCode (cheader_filename = "gio/gio.h", type_id = "g_dbus_connection_get_type ()")]
	public class DBusConnection : GLib.Object, GLib.AsyncInitable, GLib.Initable {
		public async T get_proxy<T> (string? name, string object_path, GLib.DBusProxyFlags flags = 0, GLib.Cancellable? cancellable = null) throws GLib.IOError; 
		public T get_proxy_sync<T> (string? name, string object_path, GLib.DBusProxyFlags flags = 0, GLib.Cancellable? cancellable = null) throws GLib.IOError;
		public uint register_object<T> (string object_path, T object) throws GLib.IOError;
		public async GLib.DBusMessage send_message_with_reply (GLib.DBusMessage message, GLib.DBusSendMessageFlags flags, int timeout_msec, uint32 *out_serial = null, GLib.Cancellable? cancellable = null) throws GLib.IOError;
	}

	public class DataInputStream : GLib.BufferedInputStream {
		[CCode (cname = "g_data_input_stream_read_line_async", finish_function = "g_data_input_stream_read_line_finish_utf8")]
		public async string? read_line_utf8_async (int io_priority = GLib.Priority.DEFAULT, GLib.Cancellable? cancellable = null, out size_t length) throws GLib.IOError, GLib.IOError;
	}

	[CCode (cheader_filename = "gio/gio.h", type_id = "g_file_monitor_get_type ()")]
	public abstract class FileMonitor : GLib.Object {
		[Version (deprecated_since = "2.46")]
		public GLib.MainContext context { construct; }
	}

	[Compact]
	public class IOModuleScope {
		[CCode (has_construct_function = false)]
		public IOModuleScope (GLib.IOModuleScopeFlags flags);
	}

	public class MemoryOutputStream : GLib.OutputStream {
		[CCode (has_construct_function = false, type = "GOutputStream*")]
		public MemoryOutputStream ([CCode (array_length_type = "gsize")] owned uint8[]? data, GLib.ReallocFunc? realloc_function = GLib.g_realloc, GLib.DestroyNotify? destroy_function = GLib.g_free);
	}

	[CCode (cheader_filename = "gio/gio.h", type_id = "g_native_socket_address_get_type ()")]
	public class NativeSocketAddress : GLib.SocketAddress {
		public NativeSocketAddress (void* native, size_t len);
	}

	public abstract class NativeVolumeMonitor : GLib.VolumeMonitor {
		[NoWrapper]
		public abstract GLib.Mount get_mount_for_mount_path (string mount_path, GLib.Cancellable? cancellable = null);
	}

	[Compact]
	[CCode (cname = "GSource", ref_function = "g_source_ref", unref_function = "g_source_unref")]
	public class PollableSource : GLib.Source {
		[CCode (type = "GSource*")]
		public PollableSource (GLib.Object pollable_stream);
		[CCode (type = "GSource*")]
		public PollableSource.full (GLib.Object pollable_stream, GLib.Source? child_source, GLib.Cancellable? cancellable = null);
		[CCode (cname = "g_source_set_callback")]
		public void set_callback ([CCode (type = "GSourceFunc")] owned PollableSourceFunc func);
	}

	[CCode (cheader_filename = "gio/gio.h", type_id = "g_settings_get_type ()")]
	public class Settings : GLib.Object {
		public void bind_with_mapping (string key, GLib.Object object, string property, GLib.SettingsBindFlags flags, GLib.SettingsBindGetMappingShared get_mapping, GLib.SettingsBindSetMappingShared set_mapping, void* user_data, GLib.DestroyNotify? notify);
	}

	public class SimpleAsyncResult : GLib.Object, GLib.AsyncResult {
		[CCode (has_construct_function = false)]
		public SimpleAsyncResult (GLib.Object? source_object, void* source_tag);
		[CCode (has_construct_function = false)]
		[PrintfFormat]
		public SimpleAsyncResult.error (GLib.Object? source_object, GLib.Quark domain, int code, string format, ...);
		[CCode (has_construct_function = false)]
		public SimpleAsyncResult.from_error (GLib.Object? source_object, GLib.Error error);
		[CCode (simple_generics = true)]
		public unowned T get_op_res_gpointer<T> ();
		[CCode (simple_generics = true)]
		public void set_op_res_gpointer<T> (owned T op_res);
	}

	[Compact]
	[CCode (cname = "GSource", ref_function = "g_source_ref", unref_function = "g_source_unref")]
	public class SocketSource : GLib.Source {
		[CCode (cname = "g_source_set_callback")]
		public void set_callback ([CCode (type = "GSourceFunc")] owned SocketSourceFunc func);
	}

	public class SocketConnection : GLib.IOStream {
		public static GLib.SocketConnection factory_create_connection (GLib.Socket socket);
	}

	public class TlsPassword : GLib.Object {
		[CCode (vfunc_name = "set_value")]
		public virtual void set_value_full ([CCode (array_length_cname = "length", array_length_pos = 1.5, array_length_type = "gssize", type = "guchar*")] owned uint8[] value, GLib.DestroyNotify? notify = GLib.g_free);
	}

	public class VolumeMonitor : GLib.Object {
		[NoWrapper]
		public virtual bool is_supported ();
	}

	public interface AsyncInitable : GLib.Object {
		[CCode (finish_function = "g_async_initable_new_finish")]
		public static async GLib.Object new_async (GLib.Type object_type, int io_priority = GLib.Priority.DEFAULT, GLib.Cancellable? cancellable, ...) throws GLib.Error;
		[CCode (finish_function = "g_async_initable_new_finish")]
		public static async GLib.Object new_valist_async (GLib.Type object_type, string first_property_name, va_list var_args, int io_priority = GLib.Priority.DEFAULT, GLib.Cancellable? cancellable = null);
		[CCode (finish_function = "g_async_initable_new_finish")]
		public static async GLib.Object newv_async (GLib.Type object_type, [CCode (array_length_pos = 1.1)] GLib.Parameter[] parameters, int io_priority = GLib.Priority.DEFAULT, GLib.Cancellable? cancellable = null);
	}

	public interface File : GLib.Object {
		[NoWrapper, Version (deprecated_since = "vala-0.16", replacement = "has_prefix")]
		public abstract bool prefix_matches (GLib.File file);
		[NoWrapper, Version (deprecated_since = "vala-0.16", replacement = "read")]
		public abstract unowned GLib.FileInputStream read_fn (GLib.Cancellable? cancellable = null) throws GLib.Error;
	}

	public interface Icon : GLib.Object {
		[NoWrapper]
		public virtual bool to_tokens (GLib.GenericArray<string> tokens, out int out_version);
		[NoWrapper]
		public virtual GLib.Icon? from_tokens (string[] tokens, int version) throws GLib.Error;
	}

	[Flags]
	public enum ConverterFlags {
		[Version (deprecated_since = "vala-0.16", replacement = "ConverterFlags.NONE")]
		NO_FLAGS
	}

	[CCode (has_target = false)]
	public delegate void SimpleActionActivateFunc (SimpleAction action, Variant? parameter, void* user_data);
	[CCode (has_target = false)]
	public delegate void SimpleActionChangeStateFunc (SimpleAction action, Variant value, void* user_data);
	[Version (deprecated_since = "vala-0.26", replacement = "SimplActionActivateFunc")]
	public delegate void SimpleActionActivateCallback (SimpleAction action, Variant? parameter);
	[Version (deprecated_since = "vala-0.26", replacement = "SimplActionChangeStateFunc")]
	public delegate void SimpleActionChangeStateCallback (SimpleAction action, Variant value);
	[CCode (cheader_filename = "gio/gio.h", instance_pos = 6.9)]
	public delegate GLib.Variant DBusInterfaceGetPropertyFunc (GLib.DBusConnection connection, string sender, string object_path, string interface_name, string property_name) throws GLib.Error;
	[CCode (cheader_filename = "gio/gio.h", instance_pos = 7.9)]
	public delegate bool DBusInterfaceSetPropertyFunc (GLib.DBusConnection connection, string sender, string object_path, string interface_name, string property_name, GLib.Variant value) throws GLib.Error;
	[Version (deprecated_since = "vala-0.16", replacement = "File.equal")]
	public static GLib.EqualFunc<GLib.File> file_equal;
	[Version (deprecated_since = "vala-0.16", replacement = "File.hash")]
	public static GLib.HashFunc<GLib.File> file_hash;
	[Version (deprecated_since = "vala-0.12", replacement = "GLib.ContentType.can_be_executable")]
	[CCode (cname = "g_content_type_can_be_executable", cheader_filename = "gio/gio.h")]
	public static bool g_content_type_can_be_executable (string type);
	[Version (deprecated_since = "vala-0.12", replacement = "GLib.ContentType.equals")]
	[CCode (cname = "g_content_type_equals", cheader_filename = "gio/gio.h")]
	public static bool g_content_type_equals (string type1, string type2);
	[Version (deprecated_since = "vala-0.12", replacement = "GLib.ContentType.from_mime_type")]
	[CCode (cname = "g_content_type_from_mime_type", cheader_filename = "gio/gio.h")]
	public static string? g_content_type_from_mime_type (string mime_type);
	[Version (deprecated_since = "vala-0.12", replacement = "GLib.ContentType.get_description")]
	[CCode (cname = "g_content_type_get_description", cheader_filename = "gio/gio.h")]
	public static string g_content_type_get_description (string type);
	[Version (deprecated_since = "vala-0.12", replacement = "GLib.ContentType.get_icon")]
	[CCode (cname = "g_content_type_get_icon", cheader_filename = "gio/gio.h")]
	public static GLib.Icon g_content_type_get_icon (string type);
	[Version (deprecated_since = "vala-0.12", replacement = "GLib.ContentType.get_mime_type")]
	[CCode (cname = "g_content_type_get_mime_type", cheader_filename = "gio/gio.h")]
	public static string? g_content_type_get_mime_type (string type);
	[Version (deprecated_since = "vala-0.12", replacement = "GLib.ContentType.guess")]
	[CCode (cname = "g_content_type_guess", cheader_filename = "gio/gio.h")]
	public static string g_content_type_guess (string filename, uchar[] data, out bool result_uncertain);
	[Version (deprecated_since = "vala-0.12", replacement = "GLib.ContentType.guess_for_tree")]
	[CCode (cname = "g_content_type_guess_for_tree", cheader_filename = "gio/gio.h")]
	public static string g_content_type_guess_for_tree (GLib.File root);
	[Version (deprecated_since = "vala-0.12", replacement = "GLib.ContentType.is_a")]
	[CCode (cname = "g_content_type_is_a", cheader_filename = "gio/gio.h")]
	public static bool g_content_type_is_a (string type, string supertype);
	[Version (deprecated_since = "vala-0.12", replacement = "GLib.ContentType.is_unknown")]
	[CCode (cname = "g_content_type_is_unknown", cheader_filename = "gio/gio.h")]
	public static bool g_content_type_is_unknown (string type);

	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.ACCESS_CAN_DELETE")]
	public const string FILE_ATTRIBUTE_ACCESS_CAN_DELETE;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.ACCESS_CAN_EXECUTE")]
	public const string FILE_ATTRIBUTE_ACCESS_CAN_EXECUTE;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.ACCESS_CAN_READ")]
	public const string FILE_ATTRIBUTE_ACCESS_CAN_READ;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.ACCESS_CAN_RENAME")]
	public const string FILE_ATTRIBUTE_ACCESS_CAN_RENAME;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.ACCESS_CAN_TRASH")]
	public const string FILE_ATTRIBUTE_ACCESS_CAN_TRASH;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.ACCESS_CAN_WRITE")]
	public const string FILE_ATTRIBUTE_ACCESS_CAN_WRITE;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.DOS_IS_ARCHIVE")]
	public const string FILE_ATTRIBUTE_DOS_IS_ARCHIVE;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.DOS_IS_SYSTEM")]
	public const string FILE_ATTRIBUTE_DOS_IS_SYSTEM;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.ETAG_VALUE")]
	public const string FILE_ATTRIBUTE_ETAG_VALUE;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.FILESYSTEM_FREE")]
	public const string FILE_ATTRIBUTE_FILESYSTEM_FREE;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.FILESYSTEM_READONLY")]
	public const string FILE_ATTRIBUTE_FILESYSTEM_READONLY;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.FILESYSTEM_SIZE")]
	public const string FILE_ATTRIBUTE_FILESYSTEM_SIZE;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.FILESYSTEM_TYPE")]
	public const string FILE_ATTRIBUTE_FILESYSTEM_TYPE;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.FILESYSTEM_USE_PREVIEW")]
	public const string FILE_ATTRIBUTE_FILESYSTEM_USE_PREVIEW;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.GVFS_BACKEND")]
	public const string FILE_ATTRIBUTE_GVFS_BACKEND;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.ID_FILE")]
	public const string FILE_ATTRIBUTE_ID_FILE;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.ID_FILESYSTEM")]
	public const string FILE_ATTRIBUTE_ID_FILESYSTEM;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.MOUNTABLE_CAN_EJECT")]
	public const string FILE_ATTRIBUTE_MOUNTABLE_CAN_EJECT;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.MOUNTABLE_CAN_MOUNT")]
	public const string FILE_ATTRIBUTE_MOUNTABLE_CAN_MOUNT;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.MOUNTABLE_CAN_POLL")]
	public const string FILE_ATTRIBUTE_MOUNTABLE_CAN_POLL;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.MOUNTABLE_CAN_START")]
	public const string FILE_ATTRIBUTE_MOUNTABLE_CAN_START;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.MOUNTABLE_CAN_START_DEGRADED")]
	public const string FILE_ATTRIBUTE_MOUNTABLE_CAN_START_DEGRADED;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.MOUNTABLE_CAN_STOP")]
	public const string FILE_ATTRIBUTE_MOUNTABLE_CAN_STOP;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.MOUNTABLE_CAN_UNMOUNT")]
	public const string FILE_ATTRIBUTE_MOUNTABLE_CAN_UNMOUNT;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.MOUNTABLE_HAL_UDI")]
	public const string FILE_ATTRIBUTE_MOUNTABLE_HAL_UDI;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.MOUNTABLE_IS_MEDIA_CHECK_AUTOMATIC")]
	public const string FILE_ATTRIBUTE_MOUNTABLE_IS_MEDIA_CHECK_AUTOMATIC;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.MOUNTABLE_START_STOP_TYPE")]
	public const string FILE_ATTRIBUTE_MOUNTABLE_START_STOP_TYPE;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.MOUNTABLE_UNIX_DEVICE")]
	public const string FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.MOUNTABLE_UNIX_DEVICE_FILE")]
	public const string FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE_FILE;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.OWNER_GROUP")]
	public const string FILE_ATTRIBUTE_OWNER_GROUP;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.OWNER_USER")]
	public const string FILE_ATTRIBUTE_OWNER_USER;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.OWNER_USER_REAL")]
	public const string FILE_ATTRIBUTE_OWNER_USER_REAL;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.PREVIEW_ICON")]
	public const string FILE_ATTRIBUTE_PREVIEW_ICON;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.SELINUX_CONTEXT")]
	public const string FILE_ATTRIBUTE_SELINUX_CONTEXT;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.STANDARD_ALLOCATED_SIZE")]
	public const string FILE_ATTRIBUTE_STANDARD_ALLOCATED_SIZE;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.STANDARD_CONTENT_TYPE")]
	public const string FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.STANDARD_COPY_NAME")]
	public const string FILE_ATTRIBUTE_STANDARD_COPY_NAME;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.STANDARD_DESCRIPTION")]
	public const string FILE_ATTRIBUTE_STANDARD_DESCRIPTION;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.STANDARD_DISPLAY_NAME")]
	public const string FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.STANDARD_EDIT_NAME")]
	public const string FILE_ATTRIBUTE_STANDARD_EDIT_NAME;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.STANDARD_FAST_CONTENT_TYPE")]
	public const string FILE_ATTRIBUTE_STANDARD_FAST_CONTENT_TYPE;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.STANDARD_ICON")]
	public const string FILE_ATTRIBUTE_STANDARD_ICON;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.STANDARD_IS_BACKUP")]
	public const string FILE_ATTRIBUTE_STANDARD_IS_BACKUP;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.STANDARD_IS_HIDDEN")]
	public const string FILE_ATTRIBUTE_STANDARD_IS_HIDDEN;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.STANDARD_IS_SYMLINK")]
	public const string FILE_ATTRIBUTE_STANDARD_IS_SYMLINK;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.STANDARD_IS_VIRTUAL")]
	public const string FILE_ATTRIBUTE_STANDARD_IS_VIRTUAL;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.STANDARD_NAME")]
	public const string FILE_ATTRIBUTE_STANDARD_NAME;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.STANDARD_SIZE")]
	public const string FILE_ATTRIBUTE_STANDARD_SIZE;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.STANDARD_SORT_ORDER")]
	public const string FILE_ATTRIBUTE_STANDARD_SORT_ORDER;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.STANDARD_SYMLINK_TARGET")]
	public const string FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.STANDARD_TARGET_URI")]
	public const string FILE_ATTRIBUTE_STANDARD_TARGET_URI;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.STANDARD_TYPE")]
	public const string FILE_ATTRIBUTE_STANDARD_TYPE;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.THUMBNAILING_FAILED")]
	public const string FILE_ATTRIBUTE_THUMBNAILING_FAILED;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.THUMBNAIL_PATH")]
	public const string FILE_ATTRIBUTE_THUMBNAIL_PATH;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.TIME_ACCESS")]
	public const string FILE_ATTRIBUTE_TIME_ACCESS;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.TIME_ACCESS_USEC")]
	public const string FILE_ATTRIBUTE_TIME_ACCESS_USEC;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.TIME_CHANGED")]
	public const string FILE_ATTRIBUTE_TIME_CHANGED;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.TIME_CHANGED_USEC")]
	public const string FILE_ATTRIBUTE_TIME_CHANGED_USEC;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.TIME_CREATED")]
	public const string FILE_ATTRIBUTE_TIME_CREATED;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.TIME_CREATED_USEC")]
	public const string FILE_ATTRIBUTE_TIME_CREATED_USEC;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.TIME_MODIFIED")]
	public const string FILE_ATTRIBUTE_TIME_MODIFIED;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.TIME_MODIFIED_USEC")]
	public const string FILE_ATTRIBUTE_TIME_MODIFIED_USEC;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.TRASH_DELETION_DATE")]
	public const string FILE_ATTRIBUTE_TRASH_DELETION_DATE;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.TRASH_ITEM_COUNT")]
	public const string FILE_ATTRIBUTE_TRASH_ITEM_COUNT;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.TRASH_ORIG_PATH")]
	public const string FILE_ATTRIBUTE_TRASH_ORIG_PATH;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.UNIX_BLOCKS")]
	public const string FILE_ATTRIBUTE_UNIX_BLOCKS;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.UNIX_BLOCK_SIZE")]
	public const string FILE_ATTRIBUTE_UNIX_BLOCK_SIZE;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.UNIX_DEVICE")]
	public const string FILE_ATTRIBUTE_UNIX_DEVICE;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.UNIX_GID")]
	public const string FILE_ATTRIBUTE_UNIX_GID;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.UNIX_INODE")]
	public const string FILE_ATTRIBUTE_UNIX_INODE;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.UNIX_IS_MOUNTPOINT")]
	public const string FILE_ATTRIBUTE_UNIX_IS_MOUNTPOINT;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.UNIX_MODE")]
	public const string FILE_ATTRIBUTE_UNIX_MODE;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.UNIX_NLINK")]
	public const string FILE_ATTRIBUTE_UNIX_NLINK;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.UNIX_RDEV")]
	public const string FILE_ATTRIBUTE_UNIX_RDEV;
	[Version (deprecated_since = "vala-0.16", replacement = "FileAttribute.UNIX_UID")]
	public const string FILE_ATTRIBUTE_UNIX_UID;
	[Version (deprecated_since = "vala-0.16", replacement = "Menu.ATTRIBUTE_ACTION")]
	public const string MENU_ATTRIBUTE_ACTION;
	[Version (deprecated_since = "vala-0.16", replacement = "Menu.ATTRIBUTE_LABEL")]
	public const string MENU_ATTRIBUTE_LABEL;
	[Version (deprecated_since = "vala-0.16", replacement = "Menu.ATTRIBUTE_TARGET")]
	public const string MENU_ATTRIBUTE_TARGET;
	[Version (deprecated_since = "vala-0.16", replacement = "Menu.LINK_SECTION_SECTION")]
	public const string MENU_LINK_SECTION;
	[Version (deprecated_since = "vala-0.16", replacement = "Menu.LINK_SUBMENU")]
	public const string MENU_LINK_SUBMENU;
	[Version (deprecated_since = "vala-0.16", replacement = "IOExtensionPoint.NETWORK_MONITOR")]
	public const string NETWORK_MONITOR_EXTENSION_POINT_NAME;
	[Version (deprecated_since = "vala-0.16", replacement = "IOExtensionPoint.NATIVE_VOLUME_MONITOR")]
	public const string NATIVE_VOLUME_MONITOR_EXTENSION_POINT_NAME;
	[Version (deprecated_since = "vala-0.16", replacement = "IOExtensionPoint.PROXY")]
	public const string PROXY_EXTENSION_POINT_NAME;
	[Version (deprecated_since = "vala-0.16", replacement = "IOExtensionPoint.PROXY_RESOLVER")]
	public const string PROXY_RESOLVER_EXTENSION_POINT_NAME;
	[Version (deprecated_since = "vala-0.16", replacement = "IOExtensionPoint.TLS_BACKEND")]
	public const string TLS_BACKEND_EXTENSION_POINT_NAME;
	[Version (deprecated_since = "vala-0.16", replacement = "TlsDatabase.PURPOSE_AUTHENTICATE_CLIENT")]
	public const string TLS_DATABASE_PURPOSE_AUTHENTICATE_CLIENT;
	[Version (deprecated_since = "vala-0.16", replacement = "TlsDatabase.PURPOSE_AUTHENTICATE_SERVER")]
	public const string TLS_DATABASE_PURPOSE_AUTHENTICATE_SERVER;
	[Version (deprecated_since = "vala-0.16", replacement = "IOExtensionPoint.VFS")]
	public const string VFS_EXTENSION_POINT_NAME;
	[Version (deprecated_since = "vala-0.16", replacement = "GLib.VolumeIdentifier.HAL_UDI")]
	public const string VOLUME_IDENTIFIER_KIND_HAL_UDI;
	[Version (deprecated_since = "vala-0.16", replacement = "GLib.VolumeIdentifier.LABEL")]
	public const string VOLUME_IDENTIFIER_KIND_LABEL;
	[Version (deprecated_since = "vala-0.16", replacement = "GLib.VolumeIdentifier.NFS_MOUNT")]
	public const string VOLUME_IDENTIFIER_KIND_NFS_MOUNT;
	[Version (deprecated_since = "vala-0.16", replacement = "GLib.VolumeIdentifier.UNIX_DEVICE")]
	public const string VOLUME_IDENTIFIER_KIND_UNIX_DEVICE;
	[Version (deprecated_since = "vala-0.16", replacement = "GLib.VolumeIdentifier.UUID")]
	public const string VOLUME_IDENTIFIER_KIND_UUID;
	[Version (deprecated_since = "vala-0.16", replacement = "IOExtensionPoint.VOLUME_MONITOR")]
	public const string VOLUME_MONITOR_EXTENSION_POINT_NAME;

	[Version (deprecated_since = "vala-0.16", replacement = "ContentType.list_registered")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_content_types_get_registered")]
	public static GLib.List<string> g_content_types_get_registered ();
	[Version (deprecated_since = "vala-0.16", replacement = "BusType.get_address_sync")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_address_get_for_bus_sync")]
	public static unowned string g_dbus_address_get_for_bus_sync (GLib.BusType bus_type, GLib.Cancellable? cancellable = null) throws GLib.Error;
	[Version (deprecated_since = "vala-0.16", replacement = "DBus.address_get_stream")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_address_get_stream")]
	public static async void g_dbus_address_get_stream (string address, GLib.Cancellable? cancellable = null);
	[Version (deprecated_since = "vala-0.16", replacement = "DBus.address_get_stream_finish")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_address_get_stream_finish")]
	public static unowned GLib.IOStream g_dbus_address_get_stream_finish (GLib.AsyncResult res, string out_guid) throws GLib.Error;
	[Version (deprecated_since = "vala-0.16", replacement = "DBus.address_get_stream_sync")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_address_get_stream_sync")]
	public static unowned GLib.IOStream g_dbus_address_get_stream_sync (string address, string out_guid, GLib.Cancellable? cancellable = null) throws GLib.Error;
	[Version (deprecated_since = "vala-0.16", replacement = "DBusError.encode_gerror")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_error_encode_gerror")]
	public static unowned string g_dbus_error_encode_gerror (GLib.Error error);
	[Version (deprecated_since = "vala-0.16", replacement = "DBusError.get_remote_error")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_error_get_remote_error")]
	public static unowned string g_dbus_error_get_remote_error (GLib.Error error);
	[Version (deprecated_since = "vala-0.16", replacement = "DBusError.error_is_remote_error")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_error_is_remote_error")]
	public static bool g_dbus_error_is_remote_error (GLib.Error error);
	[Version (deprecated_since = "vala-0.16", replacement = "DBusError.new_for_dbus_error")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_error_new_for_dbus_error")]
	public static unowned GLib.Error g_dbus_error_new_for_dbus_error (string dbus_error_name, string dbus_error_message);
	[Version (deprecated_since = "vala-0.16", replacement = "DBusError.quark")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_error_quark")]
	public static GLib.Quark g_dbus_error_quark ();
	[Version (deprecated_since = "vala-0.16", replacement = "DBusError.register_error")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_error_register_error")]
	public static bool g_dbus_error_register_error (GLib.Quark error_domain, int error_code, string dbus_error_name);
	[Version (deprecated_since = "vala-0.16", replacement = "DBusError.register_error_domain")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_error_register_error_domain")]
	public static void g_dbus_error_register_error_domain (string error_domain_quark_name, size_t quark_volatile, GLib.DBusErrorEntry entries, uint num_entries);
	[Version (deprecated_since = "vala-0.16", replacement = "DBusError.set_dbus_error")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_error_set_dbus_error")]
	public static void g_dbus_error_set_dbus_error (string dbus_error_name, string dbus_error_message, string format) throws GLib.Error;
	[Version (deprecated_since = "vala-0.16", replacement = "DBusError.set_dbus_error_valist")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_error_set_dbus_error_valist")]
	public static void g_dbus_error_set_dbus_error_valist (string dbus_error_name, string dbus_error_message, string format, void* var_args) throws GLib.Error;
	[Version (deprecated_since = "vala-0.16", replacement = "DBusError.strip_remote_error")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_error_strip_remote_error")]
	public static bool g_dbus_error_strip_remote_error (GLib.Error error);
	[Version (deprecated_since = "vala-0.16", replacement = "DBusError.unregister_error")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_error_unregister_error")]
	public static bool g_dbus_error_unregister_error (GLib.Quark error_domain, int error_code, string dbus_error_name);
	[Version (deprecated_since = "vala-0.16", replacement = "DBus.generate_guid")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_generate_guid")]
	public static unowned string g_dbus_generate_guid ();
	[Version (deprecated_since = "vala-0.16", replacement = "DBus.gvalue_to_gvariant")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_gvalue_to_gvariant")]
	public static unowned GLib.Variant g_dbus_gvalue_to_gvariant (GLib.Value gvalue, GLib.VariantType type);
	[Version (deprecated_since = "vala-0.16", replacement = "DBus.gvariant_to_gvalue")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_gvariant_to_gvalue")]
	public static void g_dbus_gvariant_to_gvalue (GLib.Variant value, GLib.Value out_gvalue);
	[Version (deprecated_since = "vala-0.16", replacement = "DBus.is_address")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_is_address")]
	public static bool g_dbus_is_address (string str);
	[Version (deprecated_since = "vala-0.16", replacement = "DBus.is_guid")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_is_guid")]
	public static bool g_dbus_is_guid (string str);
	[Version (deprecated_since = "vala-0.16", replacement = "DBus.is_interface_name")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_is_interface_name")]
	public static bool g_dbus_is_interface_name (string str);
	[Version (deprecated_since = "vala-0.16", replacement = "DBus.is_member_name")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_is_member_name")]
	public static bool g_dbus_is_member_name (string str);
	[Version (deprecated_since = "vala-0.16", replacement = "DBus.is_name")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_is_name")]
	public static bool g_dbus_is_name (string str);
	[Version (deprecated_since = "vala-0.16", replacement = "DBus.is_supported_address")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_is_supported_address")]
	public static bool g_dbus_is_supported_address (string str) throws GLib.Error;
	[Version (deprecated_since = "vala-0.16", replacement = "DBus.is_unique_name")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_dbus_is_unique_name")]
	public static bool g_dbus_is_unique_name (string str);

	[Version (deprecated_since = "vala-0.16", replacement = "IOError.from_errno")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_io_error_from_errno")]
	public static unowned GLib.IOError g_io_error_from_errno (int err_no);
	[Version (deprecated_since = "vala-0.16", replacement = "IOError.quark")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_io_error_quark")]
	public static GLib.Quark g_io_error_quark ();

	[Version (deprecated_since = "vala-0.16", replacement = "IOModule.load_all_in_directory")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_io_modules_load_all_in_directory")]
	public static GLib.List<weak GLib.TypeModule> g_io_modules_load_all_in_directory (string dirname);
	[Version (deprecated_since = "vala-0.16", replacement = "IOModule.load_all_in_directory_with_scope")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_io_modules_load_all_in_directory_with_scope")]
	public static unowned GLib.List g_io_modules_load_all_in_directory_with_scope (string dirname, GLib.IOModuleScope scope);
	[Version (deprecated_since = "vala-0.16", replacement = "IOModule.scan_all_in_directory")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_io_modules_scan_all_in_directory")]
	public static void g_io_modules_scan_all_in_directory (string dirname);
	[Version (deprecated_since = "vala-0.16", replacement = "IOModule.xscan_all_in_directory_with_scope")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_io_modules_scan_all_in_directory_with_scope")]
	public static void g_io_modules_scan_all_in_directory_with_scope (string dirname, GLib.IOModuleScope scope);

	[Version (deprecated_since = "vala-0.16", replacement = "IOSchedulerJob.cancel_all")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_io_scheduler_cancel_all_jobs")]
	public static void g_io_scheduler_cancel_all_jobs ();
	[Version (deprecated_since = "vala-0.16", replacement = "IOSchedulerJob.push")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_io_scheduler_push_job")]
	public static void g_io_scheduler_push_job (owned GLib.IOSchedulerJobFunc job_func, int io_priority = GLib.Priority.DEFAULT, GLib.Cancellable? cancellable = null);

	[Version (deprecated_since = "vala-0.16", replacement = "PollableSource")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_pollable_source_new")]
	public static unowned GLib.TimeoutSource g_pollable_source_new (GLib.Object pollable_stream);

	[Version (deprecated_since = "vala-0.16", replacement = "report_error_in_idle")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_simple_async_report_error_in_idle")]
	public static void g_simple_async_report_error_in_idle (GLib.Object object, GLib.AsyncReadyCallback callback, GLib.Quark domain, int code, string format);
	[Version (deprecated_since = "vala-0.16", replacement = "report_gerror_in_idle")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_simple_async_report_gerror_in_idle")]
	public static void g_simple_async_report_gerror_in_idle (GLib.Object object, GLib.AsyncReadyCallback callback, GLib.Error error);
	[Version (deprecated_since = "vala-0.16", replacement = "report_take_gerror_in_idle")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_simple_async_report_take_gerror_in_idle")]
	public static void g_simple_async_report_take_gerror_in_idle (GLib.Object object, GLib.AsyncReadyCallback callback, GLib.Error error);

	[Version (deprecated_since = "vala-0.16", replacement = "TlsError.quark")]
	[CCode (cheader_filename = "gio/gio.h", cname = "g_tls_error_quark")]
	public static GLib.Quark g_tls_error_quark ();

	[CCode (cheader_filename = "gio/gio.h", has_target = false, cname = "GSettingsBindGetMapping")]
	public delegate bool SettingsBindGetMappingShared (GLib.Value value, GLib.Variant variant, void* user_data);
	[CCode (cheader_filename = "gio/gio.h", has_target = false, cname = "GSettingsBindSetMapping")]
	public delegate GLib.Variant SettingsBindSetMappingShared (GLib.Value value, GLib.VariantType expected_type, void* user_data);
}
