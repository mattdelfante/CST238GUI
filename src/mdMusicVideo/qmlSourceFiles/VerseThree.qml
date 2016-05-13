import QtQuick 2.0

Rectangle
{
    property alias endOfDuckSceneTimer: endOfDuckSceneTimer
    id: verseThreeWrapper
    anchors.fill: parent
    visible: false

    Timer
    {
        id: endOfDuckSceneTimer
        running: false
        interval: 2700
        onTriggered:
        {
            rideTheDucksWrapper.visible = false
            endOfMyHouseIsYourHouseTimer.start()
            myHouseIsYourHouseWrapper.visible = true
        }
    }

    Rectangle
    {
        id:rideTheDucksWrapper
        anchors.fill: parent
        color: "transparent"
        Image
        {
            id: rideTheDucksImage
            source: "../images/rideTheDucks.jpg"
            anchors.fill: parent
        }

        AnimatedImage
        {
            id: dancingMatt
            width: parent.width/12
            height: parent.height / 3
            visible: true
            source: "../images/mattPerson/dancingGifMatt.gif"
            y: parent.height * .19
            x: parent.width / 6
        }
        AnimatedImage
        {
            id: dancingMolli
            width: parent.width/12
            height: parent.height/3
            visible: true
            source: "../images/molliPerson/dancingGifMolli.gif"
            y: parent.height * .32
            x: parent.width / 2
        }
    }

    Timer
    {
        id: endOfMyHouseIsYourHouseTimer
        running: false
        interval: 2700
        onTriggered:
        {
            myHouseIsYourHouseWrapper.visible = false
        }
    }

    Rectangle
    {
        id: myHouseIsYourHouseWrapper
        anchors.fill: parent
        visible: false
        gradient: Gradient {
            GradientStop {
                position: 0.00;
                color: "#aae8e1";
            }
            GradientStop {
                position: 0.50;
                color: "#f5e075";
            }
            GradientStop {
                position: 0.99;
                color: "#f38080";
            }
        }
        Image
        {
            id: mattHouse
            source: "../images/mansion.png"
            anchors.right: parent.right
            width: parent.width * .25
            height: parent.height * .6
            anchors.bottom: parent.bottom
        }

        Image
        {
            id: molliHouse
            source: "../images/noFaceHouse.png"
            anchors.left: parent.left
            anchors.leftMargin: -30
            anchors.bottom: parent.bottom
            width: parent.width * .3125
            height: parent.height * .6
        }

        Image
        {
            id: mattNextToHouse
            source: "../images/mattPerson/mattWaitingStance.png"
            anchors.right: mattHouse.left
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -.03 * parent.height
            width: .125 * parent.width
            height: .4 * parent.height
        }

        Image
        {
            id: molliNextToHouse
            source: "../images/molliPerson/molliStanding.png"
            anchors.left: molliHouse.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -.03 * parent.height
            width: mattNextToHouse.width
            height: mattNextToHouse.height
        }

        Image
        {
            id: mattSpeechBubble
            source: "../images/speechBubble.png"
            visible: true
            width: parent.width / 8
            height: parent.height / 8
            x: mattNextToHouse.x - mattNextToHouse.width + .025 * parent.width
            y: mattNextToHouse.y
            mirror: true

            Text
            {
                id: mattText
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: "No. My house\nis your house!"
                font.pixelSize: parent.height/6
            }
        }
        Image
        {
            id: molliSpeechBubble
            source: "../images/speechBubble.png"
            visible: true
            width: parent.width / 8
            height: parent.height / 8
            x: molliNextToHouse.x + molliNextToHouse.width - .025 * parent.width
            y: molliNextToHouse.y

            Text
            {
                id: molliText
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: "My house\nis your house!"
                font.pixelSize: parent.height/6
            }
        }

    }

}
