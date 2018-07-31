install_man(['vala-gen-introspect.1', 'valac.1', 'valadoc.1', 'vapigen.1'])

if build_machine.system() != 'windows'
  # https://github.com/mesonbuild/meson/issues/1602
  mandir_path = join_paths(get_option('prefix'), get_option('mandir'))
  meson.add_install_script('sh', '-c', 'cd $DESTDIR@0@/man1; ln -fs vala-gen-introspect.1.gz @1@'.format(mandir_path, 'vala-gen-introspect@0@.1.gz'.format(vala_version_suffix)))
  meson.add_install_script('sh', '-c', 'cd $DESTDIR@0@/man1; ln -fs valac.1.gz @1@'.format(mandir_path, 'valac@0@.1.gz'.format(vala_version_suffix)))
  meson.add_install_script('sh', '-c', 'cd $DESTDIR@0@/man1; ln -fs valadoc.1.gz @1@'.format(mandir_path, 'valadoc@0@.1.gz'.format(vala_version_suffix)))
  meson.add_install_script('sh', '-c', 'cd $DESTDIR@0@/man1; ln -fs vapigen.1.gz @1@'.format(mandir_path, 'vapigen@0@.1.gz'.format(vala_version_suffix)))
endif
