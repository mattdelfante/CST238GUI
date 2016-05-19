import QtQuick 2.0
import QtQuick.Particles 2.0

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
            sadHouseWrapper.visible = true
            startSadHouseRain.start()
            startRainingFaces.start()
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
            id: sun
            source: "../images/sun.png"
            x:0
            y:0
            width: verseThreeWrapper.width * .1875
            height: verseThreeWrapper.height * .3
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

    Timer
    {
        id: startRainingFaces
        running: false
        interval: 2000
        onTriggered:
        {
            rainingSmiles.enabled = true
            sadHouseWrapper.color = "yellow"
            cryingJordanHouse.source = "../images/happyHouse.png"
        }
    }

    Timer
    {
        id: startSadHouseRain
        running: false
        interval: 2700
        onTriggered:
        {

            mattWalkWithCash.visible = true
            mattWalkAcrossHouse.running = true
        }
    }

    Rectangle
    {
        id: sadHouseWrapper
        anchors.fill: parent
        visible: false
        color: "#222a31"

        Image
        {
            id: cryingJordanHouse
            anchors.fill: parent
            source: "../images/sadHouse2.png"
        }
        ParticleSystem
        {
            id: particles
        }
        ImageParticle
        {
            source: "../images/happyFace.png"
            system: particles
        }

        Emitter
        {
            id: rainingSmiles
            system: particles
            emitRate: 15
            lifeSpan: 7000
            velocity: PointDirection { y:40; yVariation: 40; }
            acceleration: PointDirection { y: 80 }
            size: 25
            width: parent.width
            height: .2 * parent.height
            enabled: false
        }

        Image
        {
            id: mattWalkWithCash
            source: "../images/mattPerson/mattMoney.png"
            width: height * .345
            height: parent.height * .464
            x: verseThreeWrapper.width - mattWalkWithCash.width
            y: verseThreeWrapper.height - mattWalkWithCash.height
            visible: false

            //walking across the house
            NumberAnimation
            {
                id: mattWalkAcrossHouse
                target: mattWalkWithCash
                properties: "x"
                from: verseThreeWrapper.width - mattWalkWithCash.width
                to: 0
                duration: 2700
                running: false
                onRunningChanged:
                {
                    if (running === false)
                    {
                        sadHouseWrapper.visible = false
                        sportsSceneWrapper.visible = true
                        homerun.visible = true
                        endOfHomerun.start()
                    }
                }
            }
        }
    }

    Timer
    {
        id: endOfHomerun
        interval: 900
        running: false
        onTriggered:
        {
            homerun.visible = false
            slamDunk.visible = true
            endOfBasketabll.start()
        }
    }

    Timer
    {
        id: endOfBasketabll
        interval: 700
        running: false
        onTriggered:
        {
            slamDunk.visible = false
            endOfTouchdown.start()
            touchDownPass.visible = true
        }
    }

    Timer
    {
        id: endOfTouchdown
        interval: 1100
        running: false
        onTriggered:
        {
            touchDownPass.visible = false
            miCasaIsTuCasaWrapper.visible = true
        }
    }

    Rectangle
    {
        id: sportsSceneWrapper
        anchors.fill: parent
        visible: false
        Image
        {
            id: homerun
            source: "../images/mattPerson/homerun.jpg"
            visible: false
            anchors.fill: parent
            Text
            {
                id: homeRunText
                x: verseThreeWrapper.width * .575
                y: verseThreeWrapper.height * .37
                text: "This is acutally me!"
                color: "red"
                font.pixelSize: parent.height/12
                font.family: "Monotype Corsiva"
            }
        }

        Image
        {
            id: slamDunk
            source: "../images/molliPerson/slamDunk.png"
            anchors.fill: parent
            visible: false
        }

        Image
        {
            id: touchDownPass
            source: "../images/molliPerson/tuchdownPass.png"
            anchors.fill: parent
            visible: false
        }
    }

    Rectangle
    {
        id: miCasaIsTuCasaWrapper
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
            id: mattCasa
            source: "../images/mansion.png"
            anchors.right: parent.right
            width: parent.width * .25
            height: parent.height * .6
            anchors.bottom: parent.bottom
        }
        Image
        {
            id: sunSpanish
            source: "../images/sun.png"
            x:0
            y:0
            width: verseThreeWrapper.width * .1875
            height: verseThreeWrapper.height * .3
       }

        Image
        {
            id: molliCasa
            source: "../images/noFaceHouse.png"
            anchors.left: parent.left
            anchors.leftMargin: -30
            anchors.bottom: parent.bottom
            width: parent.width * .3125
            height: parent.height * .6
        }

        Image
        {
            id: mattNextToCasa
            source: "../images/mattPerson/mattSombrero.png"
            anchors.right: mattCasa.left
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -.03 * parent.height
            width: .125 * parent.width
            height: .4 * parent.height
        }

        Image
        {
            id: molliNextToCasa
            source: "../images/molliPerson/molliSombrero.png"
            anchors.left: molliCasa.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -.03 * parent.height
            width: mattNextToHouse.width
            height: mattNextToHouse.height
        }

        Image
        {
            id: mattSpanishBubble
            source: "../images/speechBubble.png"
            visible: true
            width: parent.width / 8
            height: parent.height / 8
            x: mattNextToHouse.x - mattNextToHouse.width + .025 * parent.width
            y: mattNextToHouse.y
            mirror: true

            Text
            {
                id: mattTextSpanish
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: "No. Mi casa\nes tu casa!"
                font.pixelSize: parent.height/6
            }
        }
        Image
        {
            id: molliSpanishBubble
            source: "../images/speechBubble.png"
            visible: true
            width: parent.width / 8
            height: parent.height / 8
            x: molliNextToHouse.x + molliNextToHouse.width - .025 * parent.width
            y: molliNextToHouse.y

            Text
            {
                id: molliTextSpanish
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: "Mi casa\nes tu casa!"
                font.pixelSize: parent.height/6
            }
        }
    }

}
