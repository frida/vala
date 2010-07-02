project('vala',
	'c', 'vala',
	version: '0.50.0-frida',
	meson_version: '>= 0.47.0',
	license: 'LGPL2.1'
)

cc = meson.get_compiler('c')

vala_version_required = '0.39.5.8'
vala = meson.get_compiler('vala')
if not vala.version().version_compare('>= @0@'.format(vala_version_required))
	error('valac >= @0@ required!'.format(vala_version_required))
endif

vala_version = meson.project_version()
vala_api_version = '0.50'
vala_version_suffix = '-@0@'.format(vala_api_version)

vala_version_tokens = vala_version.split('.')
vala_major_version = vala_version_tokens[0].to_int()
vala_minor_version = vala_version_tokens[1].to_int()
vala_micro_version = vala_version_tokens[2].split('-')[0].to_int()

pkgdatadir = join_paths(get_option('prefix'), get_option('datadir'), 'vala@0@'.format(vala_version_suffix))
pkglibdir = join_paths(get_option('prefix'), get_option('libdir'), 'vala@0@'.format(vala_version_suffix))


conf = configuration_data()
conf.set_quoted('PACKAGE', meson.project_name())
conf.set_quoted('PACKAGE_BUGREPORT', 'https://bugzilla.gnome.org/browse.cgi?product=vala')
conf.set_quoted('PACKAGE_DATADIR', pkgdatadir)
conf.set_quoted('PACKAGE_NAME', meson.project_name())
conf.set_quoted('PACKAGE_STRING', '@0@ @1@'.format(meson.project_name(), vala_version))
conf.set_quoted('PACKAGE_SUFFIX', vala_version_suffix)
conf.set_quoted('PACKAGE_TARNAME', meson.project_name())
conf.set_quoted('PACKAGE_URL', 'https://wiki.gnome.org/Projects/Vala')
conf.set_quoted('PACKAGE_VERSION', vala_version)
conf.set_quoted('VERSION', vala_version)
conf.set_quoted('API_VERSION', vala_api_version)
conf.set_quoted('BUILD_VERSION', vala_version)
conf.set_quoted('VALA_HOST_OS', host_machine.system())
configure_file(input: 'config.h.meson', output: 'config.h', configuration: conf)


pkgconf = configuration_data()
pkgconf.set('prefix', get_option('prefix'))
pkgconf.set('exec_prefix', '${prefix}')
pkgconf.set('libdir', '${prefix}/@0@'.format(get_option('libdir')))
pkgconf.set('bindir', '${exec_prefix}/@0@'.format(get_option('bindir')))
pkgconf.set('datarootdir', '${prefix}/@0@'.format(get_option('datadir')))
pkgconf.set('datadir', '${datarootdir}')
pkgconf.set('includedir', '${prefix}/@0@'.format(get_option('includedir')))
pkgconf.set('pkgdatadir', '${datarootdir}/vala@0@'.format(vala_version_suffix))
pkgconf.set('pkglibdir', '${exec_prefix}/@0@'.format(get_option('libdir'), 'vala@0@'.format(vala_version_suffix)))
pkgconf.set('PACKAGE_SUFFIX', vala_version_suffix)
pkgconf.set('VERSION', vala_version)
pkg_install_dir = '@0@/pkgconfig'.format(get_option('libdir'))

configure_file(
	input: 'libvala.pc.in',
	output: 'libvala@0@.pc'.format(vala_version_suffix),
	configuration: pkgconf,
	install_dir: pkg_install_dir
)

add_project_arguments([
		'--disable-version-header',
		'--hide-internal',
		'--vapidir', join_paths(meson.source_root(), 'vapi'),
		'--pkg', 'config',
	],
	language: 'vala'
)

common_flags = [
	'-DGLIB_VERSION_MIN_REQUIRED=GLIB_VERSION_2_48',
	'-DGLIB_VERSION_MAX_ALLOWED=GLIB_VERSION_2_48',
]
ndebug = get_option('b_ndebug')
if ndebug == 'true' or (ndebug == 'if-release' and not get_option('debug'))
	common_flags += [
		'-DG_DISABLE_CAST_CHECKS',
		'-DG_DISABLE_ASSERT',
		'-DG_DISABLE_CHECKS',
	]
endif
if cc.get_id() == 'msvc'
	common_flags += [
		'-DYY_NO_UNISTD_H',
	]
elif cc.get_id() == 'gcc'
	common_flags += [
		'-Wno-discarded-qualifiers',
		'-Wno-incompatible-pointer-types',
		'-Wno-unused',
	]
endif
add_project_arguments(common_flags, language: 'c')

glib_version_required = '2.48.0'
libgvc_version_required = '2.16'

glib_dep = dependency('glib-2.0', version: '>= @0@'.format(glib_version_required))
gobject_dep = dependency('gobject-2.0', version: '>= @0@'.format(glib_version_required))
gmodule_dep = dependency('gmodule-2.0', version: '>= @0@'.format(glib_version_required))
libgvc_dep = dependency('libgvc', version: '>= @0@'.format(libgvc_version_required), required: false)

# Check for CGraph support of libgvc
if libgvc_dep.found() and cc.run('''#include <gvc.h>
		int main(void) {
		#ifdef WITH_CGRAPH
			return 0;
		#else
			return -1;
		#endif
		}''',
		dependencies: libgvc_dep).returncode() == 0
	add_project_arguments('-D', 'WITH_CGRAPH', language: 'vala')
endif

subdir('gobject-introspection')
subdir('gee')
subdir('vala')
subdir('ccode')
subdir('codegen')
subdir('compiler')
subdir('vapigen')
if libgvc_dep.found()
	subdir('libvaladoc')
	subdir('valadoc')
endif
subdir('vapi')
subdir('doc')
subdir('tests')

install_data('vala.m4', install_dir: join_paths('share', 'aclocal'))

#pycat = find_program(join_paths(meson.source_root(), 'build-aux', 'meson', 'cat.py'))
#custom_target(
#	'libvala@0@.vapi'.format(vala_version_suffix),
#	command: [pycat, '@INPUT@'],
#	depends: [valagee_lib, valacore_lib],
#	capture: true,
#	install: true,
#	install_dir: join_paths('share', 'vala', 'vapi'),
#	input: [
#		join_paths(meson.current_build_dir(), 'gee', 'gee.vapi'),
#		join_paths(meson.current_build_dir(), 'vala', 'vala.vapi'),
#	],
#	output: 'libvala@0@.vapi'.format(vala_version_suffix),
#)
