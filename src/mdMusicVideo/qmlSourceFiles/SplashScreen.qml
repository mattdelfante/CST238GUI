/*
  Name: Matthew Del Fante & Molli Drivdahl
  Lab: Lab2 Splash Screen
  Project Name: mdMusicVideo
*/
import QtQuick 2.0

Rectangle {
    id: splashScreenRect
    anchors.fill: parent

    signal makeInvisible

    Image{
        anchors.fill: parent
        source: "../images/splashScreenBg.png"
    }

    Rectangle{
        id: windowPaneRect
        width: parent.width/2
        height: parent.height/2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: parent.width/9.5
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: parent.height/5.25

        Image{
            anchors.fill: parent
            source: "../images/splashScreenWindow.png"
        }

        MyButton{
            id: playButton
            width: parent.width/2.62
            height: parent.height/2.33
            anchors.left: parent.left
            anchors.leftMargin: parent.width/12
            anchors.top: parent.top
            anchors.topMargin: parent.height/35
            buttonColor: "transparent"

            ma_buttonMouseArea.onEntered:
            {
                buttonColor = "#35cc0c"
            }

            ma_buttonMouseArea.onExited:
            {
                buttonColor = "transparent"
            }

            ma_buttonMouseArea.onClicked:
            {
                makeInvisible()
            }

            Text{
                id: playButtonText
                anchors.horizontalCenter: playButton.horizontalCenter
                anchors.verticalCenter: playButton.verticalCenter
                text: "PLAY"
                font.bold: true
                font.pixelSize: playButton.height/3
                font.family: "Monotype Corsiva"
            }
        }

        MyButton{
            id: exitButton
            width: parent.width/2.37
            height: parent.height/2.33
            anchors.right: parent.right
            anchors.rightMargin: parent.width/12
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height/12.5
            buttonColor: "transparent"

            ma_buttonMouseArea.onEntered:
            {
                buttonColor = "blue"
            }

            ma_buttonMouseArea.onExited:
            {
                buttonColor = "transparent"
            }

            ma_buttonMouseArea.onClicked:
            {
                mainWindow.close()
            }

            Text{
                id: exitButtonText
                anchors.horizontalCenter: exitButton.horizontalCenter
                anchors.verticalCenter: exitButton.verticalCenter
                text: "EXIT"
                font.bold: true
                font.pixelSize: playButton.height/3
                font.family: "Monotype Corsiva"
            }
        }

        MyButton{
            id: settingsButton
            width: parent.width/2.62
            height: parent.height/2.33
            anchors.left: parent.left
            anchors.leftMargin: parent.width/12
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height/12.5
            buttonColor: "transparent"

            ma_buttonMouseArea.onEntered:
            {
                buttonColor = "blue"
            }

            ma_buttonMouseArea.onExited:
            {
                buttonColor = "transparent"
            }

            ma_buttonMouseArea.onClicked:
            {
                //implement later
            }

            Text{
                id: settingsButtonText
                anchors.horizontalCenter: settingsButton.horizontalCenter
                anchors.verticalCenter: settingsButton.verticalCenter
                text: "SETTINGS"
                font.bold: true
                font.pixelSize: playButton.height/5
                font.family: "Monotype Corsiva"
            }
        }

        MyButton{
            id: smileButton
            width: parent.width/2.37
            height: parent.height/2.33
            anchors.right: parent.right
            anchors.rightMargin: parent.width/12
            anchors.top: parent.top
            anchors.topMargin: parent.height/35
            buttonColor: "transparent"

            ma_buttonMouseArea.onEntered:
            {
                buttonColor = "#35cc0c"
            }

            ma_buttonMouseArea.onExited:
            {
                buttonColor = "transparent"
            }

            ma_buttonMouseArea.onClicked:
            {
                //implement later
            }

            Text{
                id: smileButtonText
                anchors.horizontalCenter: smileButton.horizontalCenter
                anchors.verticalCenter: smileButton.verticalCenter
                text: ":)"
                font.bold: true
                font.pixelSize: playButton.height/5
                font.family: "Monotype Corsiva"
            }
        }
    }


}