vapigen_sources = [
	'valagidlparser.vala',
	'valavapigen.vala',
]

vapigen_name = 'vapigen@0@'.format(vala_version_suffix)

vapigen_exe = executable(
	vapigen_name,
	vapigen_sources,
	c_args: ['-DG_LOG_DOMAIN="vapigen"'],
	vala_args: [
		'--pkg', 'gidl',
		'--vapidir', meson.project_source_root() / 'gobject-introspection',
	],
	dependencies: [glib_dep, valagee_dep, valacore_dep, gidl_dep],
	install: true,
)

install_symlink(
	f'vapigen@exe_ext@',
	pointing_to: f'@vapigen_name@@exe_ext@',
	install_dir: get_option('bindir'),
)

vapicheck_sources = [
	'valavapicheck.vala',
]

vapicheck_name = 'vapicheck@0@'.format(vala_version_suffix)

executable(
	vapicheck_name,
	vapicheck_sources,
	dependencies: [glib_dep, valagee_dep, valacore_dep, gidl_dep],
	install: true,
	vala_args: ['--pkg', 'gidl', '--vapidir', meson.project_source_root() / 'gobject-introspection'],
)

install_symlink(
	f'vapicheck@exe_ext@',
	pointing_to: f'@vapicheck_name@@exe_ext@',
	install_dir: get_option('bindir'),
)

configure_file(
	input: 'vapigen.pc.in',
	output: 'vapigen@0@.pc'.format(vala_version_suffix),
	configuration: pkgconf,
	install_dir: pkg_install_dir,
)

install_data('vapigen.m4', install_dir: get_option('datadir') / 'aclocal')
install_data('Makefile.vapigen', install_dir: get_option('datadir') / 'vala')

subdir('vala-gen-introspect')
