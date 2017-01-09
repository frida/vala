doclet_gtkdoc_sources = [
	'commentconverter.vala',
	'dbus.vala',
	'doclet.vala',
	'gcomment.vala',
	'generator.vala',
	'utils.vala',
]

shared_module(
	'doclet',
	doclet_gtkdoc_sources,
	c_args: ['-DG_LOG_DOMAIN="valadoc-gtkdoc"'],
	dependencies: [gobject_dep, libvaladoc_dep],
	install: true,
	install_dir: get_option('libdir') / 'valadoc' / 'doclets' / 'gtkdoc',
)
