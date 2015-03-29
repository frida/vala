include $(top_srcdir)/Makefile.common

NULL =

AM_CPPFLAGS = \
	$(COVERAGE_CFLAGS) \
	-I$(top_builddir)/gee \
	-I$(top_builddir)/ccode \
	-I$(top_builddir)/vala \
	-I$(top_builddir)/codegen \
	$(GLIB_CFLAGS) \
	-DPACKAGE_DATADIR=\"$(pkgdatadir)\" \
	$(NULL)

BUILT_SOURCES = valac.vala.stamp

bin_PROGRAMS = \
	valac \
	$(NULL)

valac_VALASOURCES = \
	valacompiler.vala \
	$(NULL)

valac_SOURCES = \
	valac.vala.stamp \
	$(valac_VALASOURCES:.vala=.c) \
	$(NULL)

valac.vala.stamp: $(valac_VALASOURCES)
	$(VALA_V)$(VALAC) \
		$(COVERAGE_VALAFLAGS) \
		$(VALAFLAGS) \
		-C \
		--vapidir $(top_srcdir)/vapi --pkg gobject-2.0 \
		--vapidir $(top_builddir)/gee --pkg gee \
		--vapidir $(top_builddir)/ccode --pkg ccode \
		--vapidir $(top_builddir)/vala --pkg vala \
		--vapidir $(top_builddir)/codegen --pkg codegen \
		--pkg config \
		$^
	@touch $@

valac_LDADD = \
	$(COVERAGE_LIBS) \
	$(GLIB_LIBS) \
	$(top_builddir)/codegen/libvala@PACKAGE_SUFFIX@.la \
	$(NULL)

EXTRA_DIST = $(valac_VALASOURCES) valac.vala.stamp

install-exec-hook:
	cd $(DESTDIR)$(bindir) && $(LN_S) -f valac@PACKAGE_SUFFIX@$(EXEEXT) vala@PACKAGE_SUFFIX@$(EXEEXT)
if ENABLE_UNVERSIONED
	cd $(DESTDIR)$(bindir) && $(LN_S) -f valac@PACKAGE_SUFFIX@$(EXEEXT) valac$(EXEEXT)
	cd $(DESTDIR)$(bindir) && $(LN_S) -f vala@PACKAGE_SUFFIX@$(EXEEXT) vala$(EXEEXT)
endif

MAINTAINERCLEANFILES = \
	$(valac_VALASOURCES:.vala=.c) \
	$(NULL)
