import QtQuick 2.0

Rectangle {
    //left is how to referencce the MouseArea outside of this qml file,
    //right is the id of that
    property alias buttonMouseArea: mouseArea

    property bool switchColor: false
    property string myColor: myColor

    id: startMusicVideo
    height: parent.height / 6
    width: parent.width / 4
    color: myColor

    MouseArea
    {
        id: mouseArea
        anchors.fill: parent
        onClicked:
        {
            myColor = "blue"
        }

        hoverEnabled: true
        onEntered:
        {
            myColor = "green"
        }

        onExited:
        {
            myColor = "red"
        }
    }
}
