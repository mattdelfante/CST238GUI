/*
  Name: Matthew Del Fante & Molli Drivdahl
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

    TextRect{
        id: textRect
        color: "purple"
        x: parent.width/2 - width/2
        y: parent.height/4
        textBox.font.bold: true
        textBox.color: "white"
        textBox.text: "Welcome to our music video."
    }
}
