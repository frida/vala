gidl_sources = [
	'gidlmodule.c',
	'gidlnode.c',
	'gidlparser.c',
	'gmetadata.c',
]

gidl_lib = static_library('gidl',
	gidl_sources,
	dependencies: [gobject_dep, gmodule_dep])

gidl_dep = declare_dependency(
	link_with: [gidl_lib],
	include_directories: include_directories('.'),
)

flex = find_program('flex')
bison = find_program('bison')

lgen = generator(flex,
	output: '@PLAINNAME@.c',
	arguments: ['-o', '@OUTPUT@', '@INPUT@'])

lfiles = lgen.process('scannerlexer.l')

pgen = generator(bison,
	output: ['@BASENAME@.c', '@BASENAME@.h'],
	arguments: ['@INPUT@', '--defines=@OUTPUT1@', '--output=@OUTPUT0@'],
)

pfiles = pgen.process('scannerparser.y')

gen_introspect_sources = [
	'gidlwriter.c',
	'scanner.c',
	lfiles,
	pfiles,
]

gen_introspect_name = 'gen-introspect@0@'.format(vala_version_suffix)

executable(gen_introspect_name,
	gen_introspect_sources,
	install: true,
	install_dir: pkglibdir,
	dependencies: [gobject_dep, gmodule_dep, gidl_dep],
)
