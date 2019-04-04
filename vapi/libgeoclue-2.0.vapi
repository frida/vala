/* libgeoclue-2.0.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "GClue", gir_namespace = "Geoclue", gir_version = "2.0", lower_case_cprefix = "gclue_")]
namespace GClue {
	[CCode (cheader_filename = "geoclue.h", type_id = "gclue_client_proxy_get_type ()")]
	public class ClientProxy : GLib.DBusProxy, GClue.Client, GLib.AsyncInitable, GLib.DBusInterface, GLib.Initable {
		[CCode (cname = "gclue_client_proxy_new", has_construct_function = false)]
		public async ClientProxy (GLib.DBusConnection connection, GLib.DBusProxyFlags flags, string? name, string object_path, GLib.Cancellable? cancellable) throws GLib.Error;
		public static async GClue.ClientProxy create (string desktop_id, GClue.AccuracyLevel accuracy_level, GLib.Cancellable? cancellable) throws GLib.Error;
		public static async GClue.ClientProxy create_full (string desktop_id, GClue.AccuracyLevel accuracy_level, GClue.ClientProxyCreateFlags flags, GLib.Cancellable? cancellable) throws GLib.Error;
		public static GClue.ClientProxy create_full_sync (string desktop_id, GClue.AccuracyLevel accuracy_level, GClue.ClientProxyCreateFlags flags, GLib.Cancellable? cancellable = null) throws GLib.Error;
		public static GClue.ClientProxy create_sync (string desktop_id, GClue.AccuracyLevel accuracy_level, GLib.Cancellable? cancellable = null) throws GLib.Error;
		[CCode (cname = "gclue_client_proxy_new_for_bus", has_construct_function = false)]
		public async ClientProxy.for_bus (GLib.BusType bus_type, GLib.DBusProxyFlags flags, string name, string object_path, GLib.Cancellable? cancellable) throws GLib.Error;
		[CCode (has_construct_function = false, type = "GClueClient*")]
		public ClientProxy.for_bus_sync (GLib.BusType bus_type, GLib.DBusProxyFlags flags, string name, string object_path, GLib.Cancellable? cancellable = null) throws GLib.Error;
		[CCode (has_construct_function = false, type = "GClueClient*")]
		public ClientProxy.sync (GLib.DBusConnection connection, GLib.DBusProxyFlags flags, string? name, string object_path, GLib.Cancellable? cancellable = null) throws GLib.Error;
	}
	[CCode (cheader_filename = "geoclue.h", type_id = "gclue_client_skeleton_get_type ()")]
	public class ClientSkeleton : GLib.DBusInterfaceSkeleton, GClue.Client, GLib.DBusInterface {
		[CCode (has_construct_function = false, type = "GClueClient*")]
		public ClientSkeleton ();
	}
	[CCode (cheader_filename = "geoclue.h", type_id = "gclue_location_proxy_get_type ()")]
	public class LocationProxy : GLib.DBusProxy, GClue.Location, GLib.AsyncInitable, GLib.DBusInterface, GLib.Initable {
		[CCode (cname = "gclue_location_proxy_new", has_construct_function = false)]
		public async LocationProxy (GLib.DBusConnection connection, GLib.DBusProxyFlags flags, string? name, string object_path, GLib.Cancellable? cancellable) throws GLib.Error;
		[CCode (cname = "gclue_location_proxy_new_for_bus", has_construct_function = false)]
		public async LocationProxy.for_bus (GLib.BusType bus_type, GLib.DBusProxyFlags flags, string name, string object_path, GLib.Cancellable? cancellable) throws GLib.Error;
		[CCode (has_construct_function = false, type = "GClueLocation*")]
		public LocationProxy.for_bus_sync (GLib.BusType bus_type, GLib.DBusProxyFlags flags, string name, string object_path, GLib.Cancellable? cancellable = null) throws GLib.Error;
		[CCode (has_construct_function = false, type = "GClueLocation*")]
		public LocationProxy.sync (GLib.DBusConnection connection, GLib.DBusProxyFlags flags, string? name, string object_path, GLib.Cancellable? cancellable = null) throws GLib.Error;
	}
	[CCode (cheader_filename = "geoclue.h", type_id = "gclue_location_skeleton_get_type ()")]
	public class LocationSkeleton : GLib.DBusInterfaceSkeleton, GClue.Location, GLib.DBusInterface {
		[CCode (has_construct_function = false, type = "GClueLocation*")]
		public LocationSkeleton ();
	}
	[CCode (cheader_filename = "geoclue.h", type_id = "gclue_manager_proxy_get_type ()")]
	public class ManagerProxy : GLib.DBusProxy, GClue.Manager, GLib.AsyncInitable, GLib.DBusInterface, GLib.Initable {
		[CCode (cname = "gclue_manager_proxy_new", has_construct_function = false)]
		public async ManagerProxy (GLib.DBusConnection connection, GLib.DBusProxyFlags flags, string? name, string object_path, GLib.Cancellable? cancellable) throws GLib.Error;
		[CCode (cname = "gclue_manager_proxy_new_for_bus", has_construct_function = false)]
		public async ManagerProxy.for_bus (GLib.BusType bus_type, GLib.DBusProxyFlags flags, string name, string object_path, GLib.Cancellable? cancellable) throws GLib.Error;
		[CCode (has_construct_function = false, type = "GClueManager*")]
		public ManagerProxy.for_bus_sync (GLib.BusType bus_type, GLib.DBusProxyFlags flags, string name, string object_path, GLib.Cancellable? cancellable = null) throws GLib.Error;
		[CCode (has_construct_function = false, type = "GClueManager*")]
		public ManagerProxy.sync (GLib.DBusConnection connection, GLib.DBusProxyFlags flags, string? name, string object_path, GLib.Cancellable? cancellable = null) throws GLib.Error;
	}
	[CCode (cheader_filename = "geoclue.h", type_id = "gclue_manager_skeleton_get_type ()")]
	public class ManagerSkeleton : GLib.DBusInterfaceSkeleton, GClue.Manager, GLib.DBusInterface {
		[CCode (has_construct_function = false, type = "GClueManager*")]
		public ManagerSkeleton ();
	}
	[CCode (cheader_filename = "geoclue.h", type_id = "gclue_simple_get_type ()")]
	public class Simple : GLib.Object, GLib.AsyncInitable {
		[CCode (cname = "gclue_simple_new", has_construct_function = false)]
		public async Simple (string desktop_id, GClue.AccuracyLevel accuracy_level, GLib.Cancellable? cancellable) throws GLib.Error;
		public unowned GClue.ClientProxy get_client ();
		public unowned GClue.LocationProxy get_location ();
		[CCode (has_construct_function = false)]
		public Simple.sync (string desktop_id, GClue.AccuracyLevel accuracy_level, GLib.Cancellable? cancellable = null) throws GLib.Error;
		[NoAccessorMethod]
		public GClue.AccuracyLevel accuracy_level { construct; }
		public GClue.ClientProxy client { get; }
		[NoAccessorMethod]
		public string desktop_id { construct; }
		public GClue.LocationProxy location { get; }
	}
	[CCode (cheader_filename = "geoclue.h", type_id = "gclue_client_get_type ()")]
	public interface Client : GLib.Object {
		public async bool call_start (GLib.Cancellable? cancellable) throws GLib.Error;
		public bool call_start_sync (GLib.Cancellable? cancellable = null) throws GLib.Error;
		public async bool call_stop (GLib.Cancellable? cancellable) throws GLib.Error;
		public bool call_stop_sync (GLib.Cancellable? cancellable = null) throws GLib.Error;
		public void complete_start (owned GLib.DBusMethodInvocation invocation);
		public void complete_stop (owned GLib.DBusMethodInvocation invocation);
		public void emit_location_updated (string arg_old, string arg_new);
		public static unowned GLib.DBusInterfaceInfo interface_info ();
		public static uint override_properties (GLib.ObjectClass klass, uint property_id_begin);
		[NoAccessorMethod]
		public abstract bool active { get; set; }
		[NoAccessorMethod]
		public abstract string desktop_id { owned get; set; }
		[NoAccessorMethod]
		public abstract uint distance_threshold { get; set; }
		[NoAccessorMethod]
		public abstract string location { owned get; set; }
		[NoAccessorMethod]
		public abstract uint requested_accuracy_level { get; set; }
		[NoAccessorMethod]
		public abstract uint time_threshold { get; set; }
		public virtual signal bool handle_start (GLib.DBusMethodInvocation invocation);
		public virtual signal bool handle_stop (GLib.DBusMethodInvocation invocation);
		public virtual signal void location_updated (string arg_old, string arg_new);
	}
	[CCode (cheader_filename = "geoclue.h", type_id = "gclue_location_get_type ()")]
	public interface Location : GLib.Object {
		public static unowned GLib.DBusInterfaceInfo interface_info ();
		public static uint override_properties (GLib.ObjectClass klass, uint property_id_begin);
		[NoAccessorMethod]
		public abstract double accuracy { get; set; }
		[NoAccessorMethod]
		public abstract double altitude { get; set; }
		[NoAccessorMethod]
		public abstract string description { owned get; set; }
		[NoAccessorMethod]
		public abstract double heading { get; set; }
		[NoAccessorMethod]
		public abstract double latitude { get; set; }
		[NoAccessorMethod]
		public abstract double longitude { get; set; }
		[NoAccessorMethod]
		public abstract double speed { get; set; }
		[NoAccessorMethod]
		public abstract GLib.Variant timestamp { owned get; set; }
	}
	[CCode (cheader_filename = "geoclue.h", type_id = "gclue_manager_get_type ()")]
	public interface Manager : GLib.Object {
		public async bool call_add_agent (string arg_id, GLib.Cancellable? cancellable) throws GLib.Error;
		public bool call_add_agent_sync (string arg_id, GLib.Cancellable? cancellable = null) throws GLib.Error;
		[CCode (async_result_pos = 2.1)]
		public async bool call_create_client (GLib.Cancellable? cancellable, out string out_client) throws GLib.Error;
		public bool call_create_client_sync (out string out_client, GLib.Cancellable? cancellable = null) throws GLib.Error;
		public async bool call_delete_client (string arg_client, GLib.Cancellable? cancellable) throws GLib.Error;
		public bool call_delete_client_sync (string arg_client, GLib.Cancellable? cancellable = null) throws GLib.Error;
		[CCode (async_result_pos = 2.1)]
		public async bool call_get_client (GLib.Cancellable? cancellable, out string out_client) throws GLib.Error;
		public bool call_get_client_sync (out string out_client, GLib.Cancellable? cancellable = null) throws GLib.Error;
		public void complete_add_agent (owned GLib.DBusMethodInvocation invocation);
		public void complete_create_client (owned GLib.DBusMethodInvocation invocation, string client);
		public void complete_delete_client (owned GLib.DBusMethodInvocation invocation);
		public void complete_get_client (owned GLib.DBusMethodInvocation invocation, string client);
		public static unowned GLib.DBusInterfaceInfo interface_info ();
		public static uint override_properties (GLib.ObjectClass klass, uint property_id_begin);
		[NoAccessorMethod]
		public abstract uint available_accuracy_level { get; set; }
		[NoAccessorMethod]
		public abstract bool in_use { get; set; }
		public virtual signal bool handle_add_agent (GLib.DBusMethodInvocation invocation, string arg_id);
		public virtual signal bool handle_create_client (GLib.DBusMethodInvocation invocation);
		public virtual signal bool handle_delete_client (GLib.DBusMethodInvocation invocation, string arg_client);
		public virtual signal bool handle_get_client (GLib.DBusMethodInvocation invocation);
	}
	[CCode (cheader_filename = "geoclue.h", cprefix = "GCLUE_ACCURACY_LEVEL_", type_id = "gclue_accuracy_level_get_type ()")]
	public enum AccuracyLevel {
		NONE,
		COUNTRY,
		CITY,
		NEIGHBORHOOD,
		STREET,
		EXACT
	}
	[CCode (cheader_filename = "geoclue.h", cprefix = "GCLUE_CLIENT_PROXY_CREATE_", type_id = "gclue_client_proxy_create_flags_get_type ()")]
	[Flags]
	public enum ClientProxyCreateFlags {
		NONE,
		AUTO_DELETE
	}
	[CCode (cheader_filename = "geoclue.h")]
	public static unowned GLib.DBusInterfaceInfo client_interface_info ();
	[CCode (cheader_filename = "geoclue.h")]
	public static uint client_override_properties (GLib.ObjectClass klass, uint property_id_begin);
	[CCode (cheader_filename = "geoclue.h")]
	public static unowned GLib.DBusInterfaceInfo location_interface_info ();
	[CCode (cheader_filename = "geoclue.h")]
	public static uint location_override_properties (GLib.ObjectClass klass, uint property_id_begin);
	[CCode (cheader_filename = "geoclue.h")]
	public static unowned GLib.DBusInterfaceInfo manager_interface_info ();
	[CCode (cheader_filename = "geoclue.h")]
	public static uint manager_override_properties (GLib.ObjectClass klass, uint property_id_begin);
}
