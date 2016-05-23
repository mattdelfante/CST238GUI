import QtQuick 2.0
import QtQuick.Particles 2.0

Rectangle
{
    signal endScene
    id: window
    width: parent.width
    height: parent.height

    Connections
    {
        id: connectionTimer
        target: MyTimer
        onTimerTimeout:
        {
            //Begin night to day
            if (totalTimeElapsed === 71500)
            {
                groundAnimation.running = true
                starsAnimation.running = true
                sunMoonStarsRotationAnimation.running = true
                skyGradientAnimation1.running = true
                skyGradientAnimation2.running = true
            }
            //End night to day, Begin close the blinds
            else if (totalTimeElapsed === 76700)
            {
                nightToDayScene.visible = false
                closeBlindsScene.visible = true
                closeBlindsAnimation.running = true
                releaseBlindsDrawstringAnimation.running = true
                mattDancingUnderChampagne.playing = true
            }
            //End close the blinds, Begin clothes on floor
            else if (totalTimeElapsed === 81800)
            {
                closeBlindsScene.visible = false
                clothesOnFloorScene.visible = true
            }
            //Begin open champagne on Matt
            else if (totalTimeElapsed === 83300)
            {
                champagneBottle.playing = true
            }
            //End clothes on floor & open champagne on Matt, Begin come on celebrate
            else if (totalTimeElapsed === 86500)
            {
                clothesOnFloorScene.visible = false
                continueTonightScene.visible = true
                mattWalkingOntoFloorX.running = true
                mattWalkingOntoFloorY.running = true
                molliWalkingOntoFloorX.running = true
                molliWalkingOntoFloorY.running = true
            }
            //End come on celebrate, Transition scenes
            else if (totalTimeElapsed === 91000)
            {
                continueTonightScene.visible = false
                endScene()
            }
        }
    }

    Rectangle
    {
        id: nightToDayScene
        anchors.fill: parent

        //Sky gradient
        Rectangle
        {
            anchors { left: parent.left; top: parent.top; right: parent.right; bottom: parent.verticalCenter }
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    SequentialAnimation on color {
                        id: skyGradientAnimation1
                        running: false
                        loops: Animation.Infinite
                        ColorAnimation { from: "#0E1533"; to: "#14148c"; duration: 5000 }
                        ColorAnimation { from: "#14148c"; to: "#0E1533"; duration: 5000 }
                    }
                }
                GradientStop {
                    position: 1.0
                    SequentialAnimation on color {
                        id: skyGradientAnimation2
                        running: false
                        loops: Animation.Infinite
                        ColorAnimation { from: "#437284"; to: "#14aaff"; duration: 5000 }
                        ColorAnimation { from: "#14aaff"; to: "#437284"; duration: 5000 }
                    }
                }
            }
        }

        //Sun, moon, stars
        Item
        {
            width: parent.width; height: 2 * parent.height
            NumberAnimation on rotation
            {
                id: sunMoonStarsRotationAnimation
                running: false
                from: -140; to: 220; duration: 10000; loops: Animation.Infinite
            }
            Image
            {
                width: .0625 * parent.width
                height: width
                source: "file:///" + AppDir + "/images/sun.png"; y: 10; anchors.horizontalCenter: parent.horizontalCenter
                rotation: -3 * parent.rotation
            }
            Image
            {
                width: .0625 * parent.width
                height: .8 * width
                source: "file:///" + AppDir + "/images/moon.png"; y: parent.height - 74; anchors.horizontalCenter: parent.horizontalCenter
                rotation: -parent.rotation
            }
            ParticleSystem
            {
                id: particlesystem
                x: 0; y: parent.height/2
                width: parent.width; height: parent.height/2
                ImageParticle
                {
                    width: 2
                    height: 2
                    source: "file:///" + AppDir + "/images/star.png"
                    groups: ["star"]
                    color: "#00333333"
                    SequentialAnimation on opacity
                    {
                        id: starsAnimation
                        running: false
                        loops: Animation.Infinite
                        NumberAnimation { from: 0; to: 1; duration: 5000 }
                        NumberAnimation { from: 1; to: 0; duration: 5000 }
                    }
                }
                Emitter
                {
                    group: "star"
                    anchors.fill: parent
                    emitRate: parent.width / 50
                    lifeSpan: 5000
                }
            }
        }

        //Ground gradient
        Rectangle
        {
            anchors { left: parent.left; top: parent.verticalCenter; right: parent.right; bottom: parent.bottom }
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    SequentialAnimation on color {
                        id: groundAnimation
                        running: false
                        loops: Animation.Infinite
                        ColorAnimation { from: "#001600"; to: "#80c342"; duration: 5000 }
                        ColorAnimation { from: "#80c342"; to: "#001600"; duration: 5000 }
                    }
                }
                GradientStop { position: 1.0; color: "#006325" }
            }
        }

        Image
        {
            id: mansion
            source: "file:///" + AppDir + "/images/mansion.png"
            width: height
            height: .3 * parent.height
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -.1 * parent.height
        }
    }

    Rectangle
    {
        id: closeBlindsScene
        width: parent.width
        height: parent.height
        visible: false

        Image
        {
            id: openedWindow
            source: "file:///" + AppDir + "/images/openedWindow.jpg"
            anchors.fill: parent

            AnimatedImage
            {
                id: mattDancingInWindow
                source: "file:///" + AppDir + "/images/mattPerson/dancingGifMatt.gif"
                width: height/2
                height: molliHoldingBlinds.height
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: parent.height/17
            }

            Image
            {
                id: blinds
                source: "file:///" + AppDir + "/images/blinds.png"
                width: window.width
                x: 0
                y: .13 * parent.height

                PropertyAnimation
                {
                    id: closeBlindsAnimation
                    target: blinds
                    properties: "height"
                    from: .1 * window.height
                    to: .87 * window.height
                    duration: 4500
                    running: false
                }
            }

            Image
            {
                id: blindsDrawstring
                source: "file:///" + AppDir + "/images/blindsDrawstring.png"
                width: window.width
                x: 0
                y: .12 * parent.height

                PropertyAnimation
                {
                    id: releaseBlindsDrawstringAnimation
                    target: blindsDrawstring
                    properties: "height"
                    from: .906* window.height
                    to: .5 * window.height
                    duration: 4500
                    running: false
                }
            }

            Image
            {
                id: molliHoldingBlinds
                source: "file:///" + AppDir + "/images/molliPerson/molliHoldingBlinds.png"
                width: .186 * parent.width
                height: .454 * parent.height
                anchors.bottom: blindsDrawstring.bottom
                anchors.left: parent.left
            }
        }
    }

    Rectangle
    {
        id: clothesOnFloorScene
        width: parent.width
        height: parent.height
        visible: false

        Image
        {
            id: jerseysOnFloor
            source: "file:///" + AppDir + "/images/jerseysOnFloor.png"
            anchors.fill: parent
            opacity: .75
        }

        AnimatedImage
        {
            id: mattDancingUnderChampagne
            source: "file:///" + AppDir + "/images/mattPerson/dancingGifMatt.gif"
            width: .1875 * parent.width
            height: .6 * parent.height
            anchors.left: champagneBottle.horizontalCenter
            anchors.leftMargin: parent.width/8
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height/12
            playing: false
        }

        Image
        {
            id: mattSpeaking
            source: "file:///" + AppDir + "/images/speechBubble.png"
            width: parent.width/6
            height: parent.height/6
            x: mattDancingUnderChampagne.x + mattDancingUnderChampagne.width/1.25
            y: mattDancingUnderChampagne.y
            visible: false

            Text
            {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: "...Thanks."
                font.pixelSize: parent.height/6
            }
        }

        AnimatedImage
        {
            id: champagneBottle
            source: "file:///" + AppDir + "/images/champagneGif.gif"
            width: parent.width * .8
            height: (parent.height * 1.2) * .8
            x: parent.width/2 - width/2
            y: parent.height/2 - height/2
            playing: false

            onFrameChanged:
            {
                if (currentFrame === 12)
                {
                    mattDancingUnderChampagne.playing = false
                }

                if (currentFrame === 20)
                {
                    mattSpeaking.visible = true
                }
            }
        }

        Image
        {
            id: molliHoldingBottle
            source: "file:///" + AppDir + "/images/molliPerson/molliHoldingBlinds.png"
            width: .242 * parent.width
            height: .59 * parent.height
            anchors.right: champagneBottle.horizontalCenter
            anchors.rightMargin: parent.width/16
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height/12
        }
    }

    Rectangle
    {
        id: continueTonightScene
        width: parent.width
        height: parent.height
        visible: false

        AnimatedImage
        {
            id: changingSpotLights
            source: "file:///" + AppDir + "/images/changingSpotLights.gif"
            anchors.fill: parent
        }

        Image
        {
            id: mattWalking
            source: "file:///" + AppDir + "/images/mattPerson/mattStanding.png"
            width: .1 * window.width
            height: .464 * window.height

            NumberAnimation
            {
                id: mattWalkingOntoFloorX
                target: mattWalking
                properties: "x"
                from: 0
                to: .40625 * window.width
                duration: 2000
                running: false
            }

            NumberAnimation{
                id: mattWalkingOntoFloorY
                target: mattWalking
                properties: "y"
                from: .5 * window.height
                to: .3 * window.height
                duration: 2000
                running: false
            }
        }

        Image
        {
            id: molliWalking
            source: "file:///" + AppDir + "/images/molliPerson/molliStanding.png"
            width: .1475 * window.width
            height: .49 * window.height

            NumberAnimation
            {
                id: molliWalkingOntoFloorX
                target: molliWalking
                properties: "x"
                from: 0
                to: .53125 * window.width
                duration: 2000
                running: false
            }

            NumberAnimation
            {
                id: molliWalkingOntoFloorY
                target: molliWalking
                properties: "y"
                from: .5 * window.height
                to: .3 * window.height
                duration: 2000
                running: false

                onRunningChanged:
                {
                    if (running === false)
                    {
                        mattWalking.visible = false
                        molliWalking.visible = false
                        mattDancing.visible = true
                        molliDancing.visible = true
                        mattDancing.playing = true
                        molliDancing.playing = true
                    }
                }
            }
        }

        AnimatedImage
        {
            id: mattDancing
            source: "file:///" + AppDir + "/images/mattPerson/dancingGifMatt.gif"
            width: .1625 * window.width
            height: .52 * window.height
            x: .3875 * window.width
            y: .284 * window.height
            playing: false
            visible: false
        }

        AnimatedImage
        {
            id: molliDancing
            source: "file:///" + AppDir + "/images/molliPerson/dancingGifMolli.gif"
            width: .1625 * window.width
            height: .52 * window.height
            x: .52375 * window.width
            y: .284 * window.height
            playing: false
            visible: false
        }
    }
}
