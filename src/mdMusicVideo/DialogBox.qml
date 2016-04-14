import QtQuick 2.0

Rectangle {
    property alias textRect:textRect
    property alias textRectBox:textRect.textBox
    property alias button:myButton
    property alias buttonText:buttonText
    property alias buttonMouseActions:myButton.buttonMouseArea
    property alias dialogMouseArea:dialogMouseArea
    property alias drag:dialogMouseArea.drag

    height: parent.height/2
    width: parent.width/2
    radius: height/25
    border.width: 2

    TextRect{
        id: textRect
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    //***Mouse area must be here (before the button) so that the button will still be clickable. Otherwise, mouse area will be
    //layered over that portion of the button and it will no longer be clickable in that spot, only draggable.***
    MouseArea{
        id: dialogMouseArea
        anchors.fill: parent
        drag.target: parent
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
