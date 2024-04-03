valac_sources = [
	'valacompiler.vala',
]

valac_name = 'valac@0@'.format(vala_version_suffix)

valac_exe = executable(
	valac_name,
	valac_sources,
	c_args: ['-DG_LOG_DOMAIN="valac"'],
	dependencies: [glib_dep, valacodegen_dep],
	install: true,
)

install_symlink(
	f'vala@vala_version_suffix@@exe_ext@',
	pointing_to: f'@valac_name@@exe_ext@',
	install_dir: get_option('bindir'),
)
install_symlink(
	f'valac@exe_ext@',
	pointing_to: f'@valac_name@@exe_ext@',
	install_dir: get_option('bindir'),
)
install_symlink(
	f'vala@exe_ext@',
	pointing_to: f'@valac_name@@exe_ext@',
	install_dir: get_option('bindir'),
)
