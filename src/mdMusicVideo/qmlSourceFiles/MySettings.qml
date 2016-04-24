import QtQuick 2.6
import QtQuick.Controls 1.5
import Qt.labs.settings 1.0

Rectangle {
    id: settingsWrapper

    property bool isVolumeOn: true
    property bool isSubtitlesOn: false
    property bool isLoopPlayOn: false
    signal clickMainMenu
    signal clickMusicVideo

    anchors.fill: parent
    color: "orange"

    Settings
    {
        id: musicVideoSettings
        property alias volText: volumeButtonText.text
        property alias subText: subTitleButtonText.text
        property alias loopText: loopButtonText.text
        property alias volBool: settingsWrapper.isVolumeOn
        property alias subBool: settingsWrapper.isSubtitlesOn
        property alias loopBool: settingsWrapper.isLoopPlayOn
    }

    Text
    {
        id: titleText
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        text: "Settings"
        font.bold: true
        font.pixelSize: parent.height /6
        font.family: "Arial Black"
    }

    Text
    {
        id: volumeText
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: parent.width /-6.5
        anchors.top: titleText.bottom
        anchors.topMargin: parent.height / 16
        text: "Volume"
        font.bold: true
        font.pixelSize: parent.height /12
        font.family: "Monotype Corsiva"
    }

    Text
    {
        id: subtitlesText
        color: "white"
        anchors.left: volumeText.left
        anchors.horizontalCenterOffset: parent.width /-6.5
        anchors.top: volumeText.bottom
        anchors.topMargin: parent.height / 40
        text: "Subtitles"
        font.bold: true
        font.pixelSize: parent.height /12
        font.family: "Monotype Corsiva"
    }

    Text
    {
        id: loopText
        color: "white"
        anchors.left: volumeText.left
        anchors.horizontalCenterOffset: parent.width /-6.5
        anchors.top: subtitlesText.bottom
        anchors.topMargin: parent.height / 40
        text: "Loop play"
        font.bold: true
        font.pixelSize: parent.height /12
        font.family: "Monotype Corsiva"
    }

    MyButton
    {
        id: volumeButton
        width: parent.width/10
        height: parent.height/12
        radius: width/2
        anchors.left: volumeText.right
        anchors.leftMargin: parent.width / 8
        anchors.verticalCenter: volumeText.verticalCenter
        buttonColor: "light grey"

        Text
        {
            id: volumeButtonText
            anchors.horizontalCenter: volumeButton.horizontalCenter
            anchors.verticalCenter: volumeButton.verticalCenter
            text: "On"
            font.bold: true
            font.pixelSize: volumeButton.height/3
            font.family: "Monotype Corsiva"
       }

        ma_buttonMouseArea.onEntered:
        {
            buttonColor = "#00fffb"
        }
        ma_buttonMouseArea.onExited:
        {
            buttonColor = "light grey"
        }
        ma_buttonMouseArea.onClicked:
        {
            if (volumeButtonText.text === "On")
            {
                volumeButtonText.text = "Off"
                isVolumeOn = false
            }
            else
            {
                volumeButtonText.text = "On"
                isVolumeOn = true
            }
        }
    }

    MyButton
    {
        id: subTitleButton
        width: parent.width/10
        height: parent.height/12
        radius: width/2
        anchors.left: volumeButton.left
        anchors.verticalCenter: subtitlesText.verticalCenter
        buttonColor: "light grey"

        Text
        {
            id: subTitleButtonText
            anchors.horizontalCenter: subTitleButton.horizontalCenter
            anchors.verticalCenter: subTitleButton.verticalCenter
            text: "Off"
            font.bold: true
            font.pixelSize: subTitleButton.height/3
            font.family: "Monotype Corsiva"
       }

        ma_buttonMouseArea.onEntered:
        {
            buttonColor = "#00fffb"
        }
        ma_buttonMouseArea.onExited:
        {
            buttonColor = "light grey"
        }
        ma_buttonMouseArea.onClicked:
        {
            if (subTitleButtonText.text === "On")
            {
                subTitleButtonText.text = "Off"
                isSubtitlesOn = false
            }
            else
            {
                subTitleButtonText.text = "On"
                isSubtitlesOn = true
            }
        }
    }

    MyButton
    {
        id: loopButton
        width: parent.width/10
        height: parent.height/12
        radius: width/2
        anchors.left: volumeButton.left
        anchors.verticalCenter: loopText.verticalCenter
        buttonColor: "light grey"

        Text
        {
            id: loopButtonText
            anchors.horizontalCenter: loopButton.horizontalCenter
            anchors.verticalCenter: loopButton.verticalCenter
            text: "Off"
            font.bold: true
            font.pixelSize: loopButton.height/3
            font.family: "Monotype Corsiva"
       }

        ma_buttonMouseArea.onEntered:
        {
            buttonColor = "#00fffb"
        }
        ma_buttonMouseArea.onExited:
        {
            buttonColor = "light grey"
        }
        ma_buttonMouseArea.onClicked:
        {
            if (loopButtonText.text === "On")
            {
                loopButtonText.text = "Off"
                isLoopPlayOn = false
            }
            else
            {
                loopButtonText.text = "On"
                isLoopPlayOn = true
            }
        }
    }

    MyButton
    {
        id: mainMenuButton
        width: parent.width/5
        height: parent.height/6
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        buttonColor: "#7a34c4"

        Text
        {
            id: mainMenuButtonText
            anchors.horizontalCenter: mainMenuButton.horizontalCenter
            anchors.verticalCenter: mainMenuButton.verticalCenter
            text: "   Back to\nmain menu!"
            font.bold: true
            font.pixelSize: mainMenuButton.height/3
            font.family: "Monotype Corsiva"
        }

        ma_buttonMouseArea.onEntered:
        {
            buttonColor = "red"
        }
        ma_buttonMouseArea.onExited:
        {
            buttonColor = "#7a34c4"
        }
        ma_buttonMouseArea.onClicked:
        {
            clickMainMenu()
        }
    }

    MyButton
    {
        id: songButton
        width: parent.width/5
        height: parent.height/6
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        buttonColor: "#7a34c4"

        Text
        {
            id: songButtonText
            anchors.horizontalCenter: songButton.horizontalCenter
            anchors.verticalCenter: songButton.verticalCenter
            text: "Back to the\nmusic video!"
            font.bold: true
            font.pixelSize: songButton.height/3
            font.family: "Monotype Corsiva"
        }

        ma_buttonMouseArea.onEntered:
        {
            buttonColor = "red"
        }
        ma_buttonMouseArea.onExited:
        {
            buttonColor = "#7a34c4"
        }
        ma_buttonMouseArea.onClicked:
        {
            clickMusicVideo()
        }
    }
}

