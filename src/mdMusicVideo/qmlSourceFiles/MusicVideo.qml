import QtQuick 2.0
import QtMultimedia 5.6
import Qt.labs.settings 1.0
import QtQuick.Controls 1.5

Rectangle {
    //REMOVE
    property alias verseThree:verseThreeScene

    property alias creditsScene: creditsScene
    property alias myHouseSong: myHouseSong
    signal endOfCredits
    signal volumeChanged
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
        source: "file:///" + AppDir + "/sounds/myHouseFloRida.mp3"
        volume: 0.5
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
                chorusTwoScene.visible = true
                chorusTwoScene.enabled = true
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

    MolliChorus{
        id: chorusTwoScene
        enabled: false
        visible: false

        onEndScene:
        {
            chorusTwoScene.visible = false
            chorusTwoScene.enabled = false
            verseThreeScene.visible = true
            verseThreeScene.enabled = true
        }
    }

    VerseThree{
        id: verseThreeScene
        enabled: false
        visible: false

        onEndScene: {
            verseThreeScene.visible = false
            verseThreeScene.enabled = false
            chorusThreeScene.visible = true
            chorusThreeScene.enabled = true
            chorusThreeScene.endOfOutSideFloRidaHouseTimer.start()
        }
    }

    FloRidaChorus{
        id: chorusThreeScene
        enabled: false
        visible: false

        onEndScene:{
            chorusThreeScene.visible = false
            chorusThreeScene.enabled = false
            creditsScene.visible = true
            creditsScene.enabled = true
            creditsScene.transitionText1.start()
        }
    }

    Credits{
        id: creditsScene
        enabled: false
        visible: false

        //makes it so the credits button can be pressed more than
        //once and work correctly
        onVisibleChanged:
        {
            creditsScene.transitionText1.start()
            creditsScene.theEndText.visible = true
        }

        onEndScene: {
            endOfCredits()
        }
    }

    Slider
    {
        id: volumeSlider
        x: musicVideoRect.width - width
        y: musicVideoRect.height - height
        width: musicVideoRect.width * .125
        opacity: 0.25
        value: myHouseSong.volume
        onValueChanged:
        {
            settingsDisplaySettings.settingsVolumeSlide = value
        }
        onHoveredChanged:
        {
            if (opacity === 0.25)
                opacity = 1.0
            else
                opacity = 0.25
        }
        Text
        {
            id: volmeText
            text: "Volume"
            anchors.horizontalCenter: volumeSlider.horizontalCenter
            anchors.bottom: volumeSlider.top
            font.pixelSize: musicVideoRect.height/30
        }
    }
}


