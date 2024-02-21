async void handle_bytes (Bytes bytes) {
	yield handle_raw_bytes (bytes.get_data ());
}

async void handle_raw_bytes (uint8[] raw_bytes) {
}

void main () {
}
