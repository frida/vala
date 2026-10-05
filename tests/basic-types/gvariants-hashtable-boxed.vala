struct Foo {
	int manam;
}

struct Bar {
	int baz;
	static int irrelevant;
}

void test1 () {
	var ht = new HashTable<uint64?, Foo?> (int64_hash, int64_equal);
	ht[123] = { 42 };
	Variant v = ht;
	assert (v.get_type_string () == "a{t(i)}");
	assert (v.print (true) == "{uint64 123: (42,)}");

	var ht2 = (HashTable<uint64?, Bar?>) v;
	assert (ht2.length == 1);
	assert (ht2[123].baz == 42);
}

void test2 () {
	var ht = new HashTable<string, bool?> (str_hash, str_equal);
	ht["foo"] = true;
	ht["bar"] = false;
	Variant v = ht;
	assert (v.get_type_string () == "a{sb}");

	var ht2 = (HashTable<string?, bool>) v;
	assert (ht2.length == 2);
	assert (ht2["foo"] == true);
	assert (ht2["bar"] == false);
}

void test3 () {
	var ht = new HashTable<double?, Bar?> (double_hash, double_equal);
	ht[0.0] = { 0 };
	ht[42.0] = { 1 };
	ht[3.14] = { 2 };
	Variant v = ht;
	assert (v.get_type_string () == "a{d(i)}");

	var ht2 = (HashTable<double?, Foo?>) v;
	assert (ht2.length == 3);
	assert (ht2[3.14].manam == 2);
}

void main () {
	test1 ();
	test2 ();
	test3 ();
}
