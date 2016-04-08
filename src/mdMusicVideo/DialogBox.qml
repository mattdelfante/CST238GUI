import QtQuick 2.0

Rectangle {
    property alias textRect:textRect
    property alias button:myButton
    property alias buttonMouseActions:myButton.buttonMouseArea
    property alias textRectBox:textRect.textBox
    property alias buttonText:buttonText

    height: parent.height/2
    width: parent.width/2
    radius: height/25
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter

    TextRect{
        id: textRect
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    MyButton{
        id: myButton
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        Text{
            id: buttonText
            //let the user write stuff
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

        }
    }
}
