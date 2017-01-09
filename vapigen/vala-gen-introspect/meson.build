vala_gen_introspect_name = f'vala-gen-introspect@vala_version_suffix@'

configure_file(
	input: 'vala-gen-introspect.in',
	output: vala_gen_introspect_name,
	configuration: pkgconf,
	install_dir: get_option('prefix') / get_option('bindir'),
)

install_symlink(
	'vala-gen-introspect',
	pointing_to: vala_gen_introspect_name,
	install_dir: get_option('bindir'),
)
