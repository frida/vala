class FooSource : Source {
	public override bool prepare (out int timeout) {
		timeout = 1000;
		return false;
	}

	public override bool check () {
		return false;
	}

	public override bool dispatch (SourceFunc? callback) {
		return false;
	}
}

class BarSource : Source {
	public int custom_timeout;

	public BarSource (int timeout) {
		custom_timeout = timeout;
	}

	public override bool prepare (out int timeout) {
		timeout = custom_timeout;
		return false;
	}

	public override bool check () {
		return false;
	}

	public override bool dispatch (SourceFunc? callback) {
		return false;
	}
}

class ManamSource : Source {
	public override bool dispatch (SourceFunc? callback) {
		return false;
	}
}

class MotuSource : Source {
	public override bool dispatch (SourceFunc? callback) {
		return false;
	}

	private static bool closure_callback (Object motu, Closure closure) {
		var return_value = Value (typeof (bool));

		var motu_parameter = Value (typeof (Object));
		motu_parameter.set_object (motu);

		closure.invoke (out return_value, { motu_parameter }, null);

		return return_value.get_boolean ();
	}
}

void main () {
	var foo = new FooSource ();
	var bar = new BarSource (1000);
	var manam = new ManamSource ();
	var motu = new PollableSource.full (new MemoryInputStream (), new MotuSource ());
}
