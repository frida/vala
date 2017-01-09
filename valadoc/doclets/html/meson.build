doclet_html_sources = [
	'doclet.vala',
]

shared_module(
	'doclet',
	doclet_html_sources,
	c_args: ['-DG_LOG_DOMAIN="valadoc-html"'],
	dependencies: [gobject_dep, libvaladoc_dep],
	install: true,
	install_dir: get_option('libdir') / 'valadoc' / 'doclets' / 'html',
)
