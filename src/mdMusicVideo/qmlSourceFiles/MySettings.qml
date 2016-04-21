//import QtQuick 2.0
//import QtQuick.Controls 1.5
//import Qt.labs.settings 1.0
import QtQuick 2.6
import QtQuick.Controls 1.5
import Qt.labs.settings 1.0
//import QtMultimedia 5.6

Rectangle {
    id: settingsWrapper
    anchors.fill: parent
    color: "orange"

    Settings
    {
        id: musicVideoSettings
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
                volumeButtonText.text = "Off"
            else
                volumeButtonText.text = "On"
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
            id: subTitleText
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
            if (subTitleText.text === "On")
                subTitleText.text = "Off"
            else
                subTitleText.text = "On"
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
                loopButtonText.text = "Off"
            else
                loopButtonText.text = "On"
        }
    }

//    MyButton
//    {
//        id: mainMenuButton
//        width: parent.width/5
//        height: parent.height/6
//        radius: width/2
//        anchors.right: parent.width
//        anchors.bottom: parent.height
//        buttonColor: "light grey"

//        Text
//        {
//            id: mainMenuButtonText
//            anchors.horizontalCenter: mainMenuButton.horizontalCenter
//            anchors.verticalCenter: mainMenuButton.verticalCenter
//            text: "Back to main menu!"
//            font.bold: true
//            font.pixelSize: mainMenuButton.height/3
//            font.family: "Monotype Corsiva"
//       }

//        ma_buttonMouseArea.onEntered:
//        {
//            buttonColor = "#00fffb"
//        }
//        ma_buttonMouseArea.onExited:
//        {
//            buttonColor = "light grey"
//        }
//        ma_buttonMouseArea.onClicked:
//        {
////            if (loopButtonText.text === "On")
////                loopButtonText.text = "Off"
////            else
////                loopButtonText.text = "On"
//        }
    }
}

