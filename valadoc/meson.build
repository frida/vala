valadoc_sources = [
	'girwriter.vala',
	'initializerbuilder.vala',
	'symbolresolver.vala',
	'treebuilder.vala',
	'valadoc.vala',
]

valadoc_name = 'valadoc@0@'.format(vala_version_suffix)

executable(
	valadoc_name,
	valadoc_sources,
	c_args: ['-DG_LOG_DOMAIN="valadoc"'],
	dependencies: [gobject_dep, valacodegen_dep, libvaladoc_dep],
	install: true,
)

install_symlink(
	'valadoc',
	pointing_to: f'@valadoc_name@@exe_ext@',
	install_dir: get_option('bindir'),
)

subdir('doclets')
subdir('icons')
