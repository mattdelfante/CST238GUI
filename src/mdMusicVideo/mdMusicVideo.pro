TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += c++SourceFiles/main.cpp \
    c++SourceFiles/matt.cpp \
    c++SourceFiles/molli.cpp \
    c++SourceFiles/person.cpp \
    c++SourceFiles/musicvideo.cpp

RESOURCES += qml.qrc \
    images.qrc \
    sounds.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES +=

HEADERS += \
    c++HeaderFiles/matt.h \
    c++HeaderFiles/molli.h \
    c++HeaderFiles/person.h \
    c++HeaderFiles/musicvideo.h
