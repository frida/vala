[DBus (name = "org.example.Server")]
class Server : Object {
	public void sync_method (BusName sender, Cancellable? cancellable, DBusConnection conn, DBusMethodInvocation inv, int arg) throws DBusError, IOError {
	}

	public async void async_method (BusName sender, Cancellable? cancellable, DBusConnection conn, DBusMethodInvocation inv, int arg) throws DBusError, IOError {
	}
}

[DBus (name = "org.example.Server")]
interface Proxy : Object {
	public abstract void sync_method (BusName sender, Cancellable? cancellable, DBusConnection conn, DBusMethodInvocation inv, int arg) throws DBusError, IOError;
	public abstract async void async_method (BusName sender, Cancellable? cancellable, DBusConnection conn, DBusMethodInvocation inv, int arg) throws DBusError, IOError;
}

void main () {
}
