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
	c_args: ['-DPACKAGE_VALADOC_LIBDIR="@0@"'.format(join_paths(get_option('prefix'), get_option('libdir'), 'valadoc'))],
	dependencies: [gobject_dep, valacodegen_dep, libvaladoc_dep],
	install: true,
)

if build_machine.system() != 'windows'
  # https://github.com/mesonbuild/meson/issues/1602
  meson.add_install_script('sh', '-c', 'cd $DESTDIR@0@; ln -fs @1@ valadoc'.format(join_paths(get_option('prefix'), get_option('bindir')), valadoc_name))
endif

subdir('doclets')
subdir('icons')
