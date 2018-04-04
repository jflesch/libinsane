find_package(PkgConfig)

PKG_CHECK_MODULES(PC_GLIB glib-2.0)
PKG_CHECK_MODULES(PC_GOBJECT gobject-2.0)

# MESSAGE(STATUS "DEBUG: GObject include directory = ${GOBJECT_INCLUDE_DIRS}")
# MESSAGE(STATUS "DEBUG: GObject link directory = ${GOBJECT_LIBRARY_DIRS}")
# MESSAGE(STATUS "DEBUG: GObject CFlags = ${GOBJECT_CFLAGS}")
SET(GOBJECT_DEFINITIONS ${PC_GOBJECT_CFLAGS_OTHER})

FIND_PATH(GOBJECT_INCLUDE_DIR gobject.h
    PATHS
    ${PC_GOBJECT_INCLUDEDIR}
    ${PC_GOBJECT_INCLUDE_DIRS}
    PATH_SUFFIXES glib-2.0/gobject/
)
find_path(GLIB_INCLUDE_DIR
    NAMES glib.h
    HINTS ${PC_GLIB_INCLUDEDIR}
          ${PC_GLIB_INCLUDE_DIRS}
    PATH_SUFFIXES glib-2.0
)
find_path(GLIBCONFIG_INCLUDE_DIR
    NAMES glibconfig.h
    HINTS ${PC_LIBDIR} ${PC_LIBRARY_DIRS} ${_GLIB_LIBRARY_DIR}
          ${PC_GLIB_INCLUDEDIR} ${PC_GLIB_INCLUDE_DIRS}
    PATH_SUFFIXES glib-2.0/include
)

set(GLIB_INCLUDE_DIRS ${GLIB_INCLUDE_DIR} ${GOBJECT_INCLUDE_DIR} ${GLIBCONFIG_INCLUDE_DIR})

FIND_LIBRARY(GObjectLibs NAMES gobject-2.0
    PATHS
    ${PC_GOBJECT_LIBDIR}
    ${PC_GOBJECT_LIBRARY_DIRS}
)
FIND_LIBRARY(GModuleLibs NAMES gmodule-2.0
    PATHS
    ${PC_GOBJECT_LIBDIR}
    ${PC_GOBJECT_LIBRARY_DIRS}
)
FIND_LIBRARY(GThreadLibs NAMES gthread-2.0
    PATHS
    ${PC_GOBJECT_LIBDIR}
    ${PC_GOBJECT_LIBRARY_DIRS}
)
FIND_LIBRARY(GLibs NAMES glib-2.0
    PATHS
    ${PC_GOBJECT_LIBDIR}
    ${PC_GOBJECT_LIBRARY_DIRS}
)

SET(GOBJECT_LIBRARIES ${GObjectLibs} ${GModuleLibs} ${GThreadLibs} ${GLibs} )

MESSAGE(STATUS "Found GObject libraries: ${GOBJECT_LIBRARIES}")
MESSAGE(STATUS "Found GObject includes : ${GOBJECT_INCLUDE_DIR}")
