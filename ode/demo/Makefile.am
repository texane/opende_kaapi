AM_CPPFLAGS = -I$(abs_top_srcdir)/include \
        -DDRAWSTUFF_TEXTURE_PATH="\"$(abs_top_srcdir)/drawstuff/textures\""

if X11
AM_LDFLAGS = $(X_PRE_LIBS) $(X_LIBS) $(X_EXTRA_LIBS)
endif

# On Windows, GL_LIBS must go after libdrawstuff.la.
LDADD = $(top_builddir)/drawstuff/src/libdrawstuff.la \
        $(top_builddir)/ode/src/libode.la @GL_LIBS@

noinst_HEADERS = basket_geom.h texturepath.h world_geom3.h bunny_geom.h convex_bunny_geom.h \
                 icosahedron_geom.h

noinst_PROGRAMS = \
                demo_step

demo_step_SOURCES = demo_step.cpp

if WIN32
resources.o: $(top_srcdir)/drawstuff/src/resources.rc $(top_srcdir)/drawstuff/src/resource.h
	@WINDRES@ $(top_srcdir)/drawstuff/src/resources.rc -o resources.o
LDADD += resources.o
endif
