TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += c++SourceFiles/main.cpp \
    c++SourceFiles/matt.cpp \
    c++SourceFiles/molli.cpp \
    c++SourceFiles/person.cpp \
    c++SourceFiles/musicvideo.cpp \
    c++SourceFiles/mytimer.cpp

RESOURCES += qml.qrc \
    sounds.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    images/champagneGif.gif \
    images/changingSpotLights.gif \
    images/chorusBaseballField.jpg \
    images/livingRoomCouch.jpg \
    images/loungeBeachside.jpg \
    images/macklemore.jpg \
    images/mattLivingRoom.jpg \
    images/modernBedroom.jpg \
    images/modernLivingRoom.jpg \
    images/modernLivingRoom2.jpg \
    images/molliChorusHouse.jpg \
    images/openedFrontDoor.jpg \
    images/openedWindow.jpg \
    images/petDaycare.jpg \
    images/rideTheDucks.jpg \
    images/blinds.png \
    images/blindsDrawstring.png \
    images/champagneSceneBg.png \
    images/faceHouseClouds.png \
    images/jerseysOnFloor.png \
    images/mansion.png \
    images/mattChorusHouse.png \
    images/moon.png \
    images/noFaceHouse.png \
    images/raindrop.png \
    images/speechBubble.png \
    images/splashScreenBg.png \
    images/splashScreenWindow.png \
    images/star.png \
    images/sun.png \
    images/washingtonMap.png \
    images/westie.png \
    images/wineGlass.png \
    images/mattPerson/dancingGifMatt.gif \
    images/mattPerson/sittingCheersGifMatt.gif \
    images/mattPerson/sittingDrinkingGifMatt.gif \
    images/mattPerson/danceArms1.png \
    images/mattPerson/danceArms2.png \
    images/mattPerson/danceArms3.png \
    images/mattPerson/danceArms4.png \
    images/mattPerson/mattHead.png \
    images/mattPerson/mattSittingCheers1.png \
    images/mattPerson/mattSittingCheers2.png \
    images/mattPerson/mattSittingCheers3.png \
    images/mattPerson/mattSittingCheers4.png \
    images/mattPerson/mattSittingCheers5.png \
    images/mattPerson/mattSittingCheers6.png \
    images/mattPerson/mattSittingCheers7.png \
    images/mattPerson/mattStanding.png \
    images/mattPerson/mattWaitingStance.png \
    images/molliPerson/dancingGifMolli.gif \
    images/molliPerson/sittingCheersGifMolli.gif \
    images/molliPerson/sittingDrinkingGifMolli.gif \
    images/molliPerson/danceArms1.png \
    images/molliPerson/danceArms2.png \
    images/molliPerson/danceArms3.png \
    images/molliPerson/danceArms4.png \
    images/molliPerson/molliHead.png \
    images/molliPerson/molliHoldingBlinds.png \
    images/molliPerson/molliLaying.png \
    images/molliPerson/molliSittingCheers1.png \
    images/molliPerson/molliSittingCheers2.png \
    images/molliPerson/molliSittingCheers3.png \
    images/molliPerson/molliSittingCheers4.png \
    images/molliPerson/molliSittingCheers5.png \
    images/molliPerson/molliSittingCheers6.png \
    images/molliPerson/molliSittingCheers7.png \
    images/molliPerson/molliStanding.png \
    images/molliPerson/molliWalkingStance.png

HEADERS += \
    c++HeaderFiles/matt.h \
    c++HeaderFiles/molli.h \
    c++HeaderFiles/person.h \
    c++HeaderFiles/musicvideo.h \
    c++HeaderFiles/mytimer.h
