import QtQuick 2.0

Rectangle {
    //left is how to reference the MouseArea outside of this qml file,
    //right is the id of that mouse area
    property alias buttonMouseArea: mouseArea

    property bool switchColor: false
    property string myColor: myColor

    id: startMusicVideo
    height: parent.height / 6
    width: parent.width / 4
    radius: height/2
    color: myColor

    MouseArea
    {
        id: mouseArea
        anchors.fill: parent
        onClicked:
        {
            //myColor = "blue"
        }

        hoverEnabled: true
        onEntered:
        {
            //myColor = "green"
        }

        onExited:
        {
            //myColor = "red"
        }
    }
}
