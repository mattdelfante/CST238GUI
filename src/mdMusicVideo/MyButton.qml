/*
  Name: Matthew Del Fante & Molli Drivdahl
  Lab: Lab2 Splash Screen
  Project Name: mdMusicVideo
*/
import QtQuick 2.0

Rectangle {
    property alias ma_buttonMouseArea: mouseArea
    property bool switchColor: false
    property string buttonColor: buttonColor

    id: startMusicVideo
    height: parent.height / 6
    width: parent.width / 4
    radius: height/2
    color: buttonColor
    border.width: 2

    MouseArea
    {
        id: mouseArea
        anchors.fill: parent

        onClicked:
        {
            //behavior defined in SplashScreen.qml
        }

        hoverEnabled: true
        onEntered:
        {
            buttonColor = "red"
        }

        onExited:
        {
            buttonColor = "light grey"
        }
    }
}
