import QtQuick 2.0
import QtMultimedia 5.6

Rectangle {
    id: musicVideoRect
    anchors.fill: parent

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
    }
}
