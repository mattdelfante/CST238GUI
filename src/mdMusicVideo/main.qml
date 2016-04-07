/*
  Name: Matthew Del Fante and Molli Drivdahl
  Lab: Lab2 Splash Screen
  Project Name: mdMusicVideo
*/
import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    Rectangle{
        id: background
        color:"grey"
        anchors.fill:parent
     }

    MyButton{
        id: startButton
        myColor: "purple"
        height: 180
        width: parent.width * .35
        x: 200
        y: 200
        buttonMouseArea.onClicked:
        {
            startButton.visible = false
        }
        buttonMouseArea.onEntered:
        {
            myColor = "blue"
        }
        buttonMouseArea.onExited:
        {
            myColor = "purple"
        }
    }

}
