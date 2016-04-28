import QtQuick 2.0

Image {
    id: fancyFrontDoorOpen
    source: "../images/openedFrontDoor.jpg"
    width: parent.width
    height: parent.width
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter

    Image {
        id: molliWalkingToDoor
        source: "../images/molliPerson/molliWalkingStance.png"
        y: parent.height/2

        NumberAnimation on x{
            id: molliWalkingToDoorX
            target: molliWalkingToDoor
            properties: "x"
            from: 100
            to: 300
            duration: 4000
        }

        NumberAnimation on y{
            id: molliWalkingToDoorY
            target: molliWalkingToDoor
            properties: "y"
            from: 500
            to: 350
            duration: 4000
        }
    }

    Image {
        id: mattWaitingAtDoor
        source: "../images/mattPerson/mattWaitingStance.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: parent.height/20
    }
}
