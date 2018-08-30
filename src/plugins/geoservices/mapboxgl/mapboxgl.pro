TARGET = qtgeoservices_mapboxgl

QT += \
    quick-private \
    location-private \
    positioning-private \
    network \
    sql

ios {
    QMAKE_CFLAGS += -Wno-aligned-allocation-unavailable 
    QMAKE_CXXFLAGS += -Wno-aligned-allocation-unavailable 
}

HEADERS += \
    qgeoserviceproviderpluginmapboxgl.h \
    qgeomappingmanagerenginemapboxgl.h \
    qgeomapmapboxgl.h \
    qgeomapmapboxgl_p.h \
    qmapboxglstylechange_p.h \
    qsgmapboxglnode.h

SOURCES += \
    qgeoserviceproviderpluginmapboxgl.cpp \
    qgeomappingmanagerenginemapboxgl.cpp \
    qgeomapmapboxgl.cpp \
    qmapboxglstylechange.cpp \
    qsgmapboxglnode.cpp

RESOURCES += mapboxgl.qrc

OTHER_FILES += \
    mapboxgl_plugin.json

INCLUDEPATH += ../../../3rdparty/mapbox-gl-native/platform/qt/include

include(../../../3rdparty/zlib_dependency.pri)

load(qt_build_paths)
LIBS_PRIVATE += -L$$MODULE_BASE_OUTDIR/lib -lqmapboxgl$$qtPlatformTargetSuffix()

qtConfig(icu) {
    QMAKE_USE_PRIVATE += icu
}

PLUGIN_TYPE = geoservices
PLUGIN_CLASS_NAME = QGeoServiceProviderFactoryMapboxGL
load(qt_plugin)
