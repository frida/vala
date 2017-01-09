doclet_devhelp_sources = [
	'doclet.vala',
]

shared_module(
	'doclet',
	doclet_devhelp_sources,
	c_args: ['-DG_LOG_DOMAIN="valadoc-devhelp"'],
	dependencies: [gobject_dep, libvaladoc_dep],
	install: true,
	install_dir: get_option('libdir') / 'valadoc' / 'doclets' / 'devhelp',
)
