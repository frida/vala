valagee_sources = [
	'arraylist.vala',
	'collection.vala',
	'hashmap.vala',
	'hashset.vala',
	'iterable.vala',
	'iterator.vala',
	'list.vala',
	'mapiterator.vala',
	'map.vala',
	'set.vala',
	'timsort.vala'
]

valagee_lib = static_library(
	'valagee',
	valagee_sources,
	c_args: ['-DG_LOG_DOMAIN="vala"'],
	vala_args: ['--use-header'],
	vala_header: 'valagee.h',
	vala_vapi: 'gee.vapi',
	dependencies: [gobject_dep],
	install: true,
	install_dir: [
		false,
		get_option('includedir') / f'vala@vala_version_suffix@',
		false
	],
)

valagee_dep = declare_dependency(
	link_with: [valagee_lib],
	include_directories: include_directories('.', '..'),
)
