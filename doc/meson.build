install_man(['vala-gen-introspect.1', 'valac.1', 'valadoc.1', 'vapigen.1'])

foreach page : ['vala-gen-introspect', 'valac', 'valadoc', 'vapigen']
	install_symlink(
		f'@page@@vala_version_suffix@.1',
		pointing_to: f'@page@.1',
		install_dir: get_option('mandir') / 'man1',
	)
endforeach
