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
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    anchors.bottomMargin: parent.height/20
    anchors.rightMargin: parent.width/7
    border.width: 2

    TextRect{
        id: textRect
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    MyButton{
        id: myButton
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/6
        anchors.horizontalCenter: parent.horizontalCenter

        Text{
            id: buttonText
            //let the user write stuff
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

        }
    }
}
