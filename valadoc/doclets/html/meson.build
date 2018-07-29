doclet_html_sources = [
	'doclet.vala',
]

shared_module(
	'doclet',
	doclet_html_sources,
	dependencies: [gobject_dep, libvaladoc_dep],
	install: true,
	install_dir: join_paths (get_option('libdir'), 'valadoc', 'doclets', 'html'),
)
