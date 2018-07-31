valac_sources = [
	'valacompiler.vala',
]

valac_name = 'valac@0@'.format(vala_version_suffix)

valac_exe = executable(
	valac_name,
	valac_sources,
	dependencies: [glib_dep, valacodegen_dep],
	install: true,
)

vala_name = 'vala@0@'.format(vala_version_suffix)

if build_machine.system() != 'windows'
  # https://github.com/mesonbuild/meson/issues/1602
  bindir_path = join_paths(get_option('prefix'), get_option('bindir'))
  meson.add_install_script('sh', '-c', 'cd $DESTDIR@0@; ln -fs @1@ valac'.format(bindir_path, valac_name))
  meson.add_install_script('sh', '-c', 'cd $DESTDIR@0@; ln -fs @1@ @2@'.format(bindir_path, valac_name, vala_name))
  meson.add_install_script('sh', '-c', 'cd $DESTDIR@0@; ln -fs @1@ vala'.format(bindir_path, valac_name))
endif
