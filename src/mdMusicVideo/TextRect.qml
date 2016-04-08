import QtQuick 2.0

Rectangle {
    property alias textBox:text
    property string words: words
    id: rect
    width: parent.width/3
    height: parent.height/4
    border.width: 2
    radius: height/10

    Text{
        id: text
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        //text: words
    }
}
