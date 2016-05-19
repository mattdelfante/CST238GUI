import QtQuick 2.0
import QtMultimedia 5.6
import Qt.labs.settings 1.0

Rectangle {
    property alias myHouseSong: myHouseSong
    id: musicVideoRect
    anchors.fill: parent
    property bool afterVerseTwo: false

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

        onPlaying:
        {
            seekable: true
        }
    }

    ChampagneScene
    {
        id: champagneIntroScene
        visible: true

        onEndScene:
        {
            champagneIntroScene.visible = false
            champagneIntroScene.enabled = false
            verseOneScene.visible = true
            verseOneScene.enabled = true
        }
    }

    VerseOne
    {
        id: verseOneScene
        enabled: false
        visible: false

        onEndScene:
        {
            verseOneScene.visible = false
            verseOneScene.enabled = false
            preChorusScene.visible = true
            preChorusScene.enabled = true
        }
    }

    PreChorus
    {
        id: preChorusScene
        enabled: false
        visible: false

        onEndScene:{
            preChorusScene.visible = false
            preChorusScene.enabled = false

            if (!afterVerseTwo)
            {
                chorusOneScene.visible = true
                chorusOneScene.enabled = true
            }
            else
            {
                //chorusTwoScene.visible = true
                //chorusTwoScene.enabled = true
            }
        }
    }

    MattChorus{
        id: chorusOneScene
        enabled: false
        visible: false

        onEndScene:
        {
            chorusOneScene.visible = false
            chorusOneScene.enabled = false
            verseTwoScene.visible = true
            verseTwoScene.enabled = true
        }
    }

    VerseTwo{
        id: verseTwoScene
        enabled: false
        visible: false

        onEndScene:
        {
            afterVerseTwo = true
            verseTwoScene.visible = false
            verseTwoScene.enabled = false
            preChorusScene.visible = true
            preChorusScene.enabled = true
        }
    }

}


