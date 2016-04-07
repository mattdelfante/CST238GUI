import QtQuick 2.0

Rectangle {
    property alias textBox:text
    id: rect
    width: parent.width/6
    height: parent.height/8
    border.width: 2
    radius: 10

    Text{
        id: text
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
}
