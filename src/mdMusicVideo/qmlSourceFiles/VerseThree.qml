import QtQuick 2.0
import QtQuick.Particles 2.0

Rectangle
{
    signal endScene
    id: verseThreeWrapper
    anchors.fill: parent
    visible: false

    Connections{
        id: connectionTimer
        target: MyTimer
        onTimerTimeout:{
            if (totalTimeElapsed === 135100)
            {
                rideTheDucksWrapper.visible = false
                myHouseIsYourHouseWrapper.visible = true
            }

            else if (totalTimeElapsed === 137800)
            {
                myHouseIsYourHouseWrapper.visible = false
                sadHouseWrapper.visible = true
            }

            else if (totalTimeElapsed === 140100)
            {
                rainingSmiles.enabled = true
                sadHouseWrapper.color = "yellow"
                cryingJordanHouse.source = "file:///" + AppDir + "/images/happyHouse.png"
                startSadHouseRain.start()
            }

            else if (totalTimeElapsed === 143900)
            {
                homerun.visible = false
                slamDunk.visible = true
            }

            else if (totalTimeElapsed === 144600)
            {
                slamDunk.visible = false
                touchDownPass.visible = true
            }

            else if (totalTimeElapsed === 145700)
            {
                touchDownPass.visible = false
                miCasaIsTuCasaWrapper.visible = true
            }

            else if (totalTimeElapsed === 148400)
            {
                mattSpanishBubble.visible = false
                molliSpanishBubble.visible = false
                mattDrink.visible = true
                mattDrink.playing = true
                molliDrink.visible = true
                molliDrink.playing = true
            }

            else if (totalTimeElapsed === 152500)
            {
                verseThreeWrapper.visible = false
                endScene()
            }
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
            source: "file:///" + AppDir + "/images/rideTheDucks.jpg"
            anchors.fill: parent
        }

        AnimatedImage
        {
            id: dancingMatt
            width: parent.width/12
            height: parent.height / 3
            visible: true
            source: "file:///" + AppDir + "/images/mattPerson/dancingGifMatt.gif"
            y: parent.height * .19
            x: parent.width / 6
        }
        AnimatedImage
        {
            id: dancingMolli
            width: parent.width/12
            height: parent.height/3
            visible: true
            source: "file:///" + AppDir + "/images/molliPerson/dancingGifMolli.gif"
            y: parent.height * .32
            x: parent.width / 2
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
            source: "file:///" + AppDir + "/images/mansion.png"
            anchors.right: parent.right
            width: parent.width * .25
            height: parent.height * .6
            anchors.bottom: parent.bottom
        }

        Image
        {
            id: molliHouse
            source: "file:///" + AppDir + "/images/noFaceHouse.png"
            anchors.left: parent.left
            anchors.leftMargin: -30
            anchors.bottom: parent.bottom
            width: parent.width * .3125
            height: parent.height * .6
        }

        Image
        {
            id: sun
            source: "file:///" + AppDir + "/images/sun.png"
            x:0
            y:0
            width: verseThreeWrapper.width * .1875
            height: verseThreeWrapper.height * .3
       }

        Image
        {
            id: mattNextToHouse
            source: "file:///" + AppDir + "/images/mattPerson/mattWaitingStance.png"
            anchors.right: mattHouse.left
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -.03 * parent.height
            width: .125 * parent.width
            height: .4 * parent.height
        }

        Image
        {
            id: molliNextToHouse
            source: "file:///" + AppDir + "/images/molliPerson/molliStanding.png"
            anchors.left: molliHouse.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -.03 * parent.height
            width: mattNextToHouse.width
            height: mattNextToHouse.height
        }

        Image
        {
            id: mattSpeechBubble
            source: "file:///" + AppDir + "/images/speechBubble.png"
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
            source: "file:///" + AppDir + "/images/speechBubble.png"
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

    PauseAnimation {
        id: startSadHouseRain
        duration: 200
        running: false

        onRunningChanged:{
            if (running === false)
            {
                mattWalkWithCash.visible = true
                mattWalkAcrossHouse.running = true
            }
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
            source: "file:///" + AppDir + "/images/sadHouse2.png"
        }
        ParticleSystem
        {
            id: particles
        }
        ImageParticle
        {
            source: "file:///" + AppDir + "/images/happyFace.png"
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
            source: "file:///" + AppDir + "/images/mattPerson/mattMoney.png"
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
                duration: 2800
                running: false
                onRunningChanged:
                {
                    if (running === false)
                    {
                        sadHouseWrapper.visible = false
                        sportsSceneWrapper.visible = true
                        homerun.visible = true
                    }
                }
            }
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
            source: "file:///" + AppDir + "/images/mattPerson/homerun.jpg"
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
            source: "file:///" + AppDir + "/images/molliPerson/slamDunk.png"
            anchors.fill: parent
            visible: false
        }

        Image
        {
            id: touchDownPass
            source: "file:///" + AppDir + "/images/molliPerson/tuchdownPass.png"
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
            source: "file:///" + AppDir + "/images/mansion.png"
            anchors.right: parent.right
            width: parent.width * .25
            height: parent.height * .6
            anchors.bottom: parent.bottom
        }
        Image
        {
            id: sunSpanish
            source: "file:///" + AppDir + "/images/sun.png"
            x:0
            y:0
            width: verseThreeWrapper.width * .1875
            height: verseThreeWrapper.height * .3
       }

        Image
        {
            id: molliCasa
            source: "file:///" + AppDir + "/images/noFaceHouse.png"
            anchors.left: parent.left
            anchors.leftMargin: -30
            anchors.bottom: parent.bottom
            width: parent.width * .3125
            height: parent.height * .6
        }

        AnimatedImage
        {
            id: mattDrink
            anchors.right: mattCasa.left
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -.03 * parent.height
            width: .125 * parent.width
            height: .4 * parent.height
            source: "file:///" + AppDir + "/images/mattPerson/mattSombreroGif.gif"
            visible: true
            playing: false
        }

        AnimatedImage
        {
            id: molliDrink
            anchors.left: molliCasa.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -.03 * parent.height
            width: mattNextToHouse.width
            height: mattNextToHouse.height
            source: "file:///" + AppDir + "/images/molliPerson/molliSombreroGif.gif"
            visible: true
            playing: false
            onPlayingChanged:
            {
                if (playing === false)
                {
                    triggerLawnChairsPause.start()
                }
            }
        }

        PauseAnimation{
            id: triggerLawnChairsPause
            duration: 500
            running: false

            onRunningChanged:
            {
                if (running === false)
                {
                    molliDrink.visible = false
                    mattDrink.visible = false
                    lawnChairMatt.visible = true
                    lawnChairMolli.visible = true
                }
            }
        }

        Image
        {
            id: lawnChairMatt
            source: "file:///" + AppDir + "/images/mattPerson/mattLayingLawnChair.png"
            anchors.right: mattCasa.left
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -.03 * parent.height
            width: .2 * parent.width
            height: .4 * parent.height
            visible: false
        }

        Image
        {
            id: lawnChairMolli
            source: "file:///" + AppDir + "/images/molliPerson/molliLayingLawnChair.png"
            anchors.left: molliCasa.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -.03 * parent.height
            width: lawnChairMatt.width
            height: mattNextToHouse.height
            visible: false
        }

        Image
        {
            id: mattSpanishBubble
            source: "file:///" + AppDir + "/images/speechBubble.png"
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
            source: "file:///" + AppDir + "/images/speechBubble.png"
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
