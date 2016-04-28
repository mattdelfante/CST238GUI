import QtQuick 2.0
import QtMultimedia 5.6
import Qt.labs.settings 1.0

Rectangle {
    property alias myHouseSong: myHouseSong
    id: musicVideoRect
    anchors.fill: parent

    Settings
    {
        id: musicVideoSettings
        property alias volLevel: myHouseSong.volume
    }

    Audio
    {
        id: myHouseSong
        source: "../sounds/myHouseFloRida.mp3"
        volume: 1.0

        onPlaying:{
            seekable: true
        }
    }

    ChampagneScene
    {
        id: champagneIntroScene

        visible: true
        //signal set enabled to false
        onEndScene:
        {
            nightBegins.enabled = true
            nightBegins.visible = true
            nightBegins.timerNightBegins.start()
            champagneIntroScene.visible = false
            champagneIntroScene.enabled = false
        }
    }

    VerseOne
    {
        id: nightBegins
        enabled: false
        visible: false
    }
}
