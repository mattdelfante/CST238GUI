import QtQuick 2.0

Rectangle
{
    property alias endOfOutSideFloRidaHouseTimer: endOfOutSideFloRidaHouseTimer
    signal endScene
    id: floRidaChorusWrapper
    anchors.fill: parent

    Rectangle
    {
        id: outsideFloRidaHouseWrapper
        anchors.fill: parent
        Image
        {
            source: "file:///" + AppDir + "/images/floRidaHouse.jpg"
            anchors.fill: parent
        }
    }

    Timer
    {
        id: endOfOutSideFloRidaHouseTimer
        interval: 2000
        running: false
        onTriggered:
        {
            outsideFloRidaHouseWrapper.visible = false
            garageSceneWrapper.visible = true
            floRidaWalkHalfwayX.running = true
        }
    }

    Rectangle
    {
        id: garageSceneWrapper
        anchors.fill: parent
        visible: false
        Image
        {
            id: garage
            source: "file:///" + AppDir + "/images/floRidaGarage.jpg"
            anchors.fill: parent
        }
        Image
        {
            id: floRidaInGarage
            source: "file:///" + AppDir + "/images/floRidaPerson/floRidaStanding.png"
            x: 0
            y: floRidaChorusWrapper.height - height
            width: floRidaChorusWrapper.width * .1
            height: floRidaChorusWrapper.height * .464

            NumberAnimation
            {
                id: floRidaWalkHalfwayX
                target: floRidaInGarage
                properties: "x"
                from: 0
                to: (floRidaChorusWrapper.width / 2) - floRidaInGarage.width
                duration: 2400
                running: false
                onRunningChanged:
                {
                    if(running === false)
                    {
                        floRidaTalkCars.visible = true
                        bubbleText.visible = true
                        talkingPause.start()
                    }
                }
            }
            NumberAnimation
            {
                id: floRidaWalkAllTheWayX
                target: floRidaInGarage
                properties: "x"
                from: (floRidaChorusWrapper.width / 2) - floRidaInGarage.width
                to: floRidaChorusWrapper.width
                duration: 2400
                running: false
                onRunningChanged:
                {
                    if(running === false)
                    {
                        garageSceneWrapper.visible = false
                        floRidaOnStageWrapper.visible = true
                        floRidaWalkHalfwayXonStage.running = true
                    }
                }
            }

        }

        Timer
        {
            id:talkingPause
            running: false
            interval: 2900
            onTriggered:
            {
                floRidaWalkAllTheWayX.running = true
                floRidaTalkCars.visible = false
                bubbleText.visible = false
            }
        }

        Image
        {
            id: floRidaTalkCars
            source: "file:///" + AppDir + "/images/speechBubble.png"
            width: parent.width / 5
            height: parent.height / 5
            x: floRidaInGarage.x + floRidaInGarage.width - floRidaChorusWrapper.width * .00625
            y: floRidaInGarage.y - floRidaChorusWrapper.height * .06
            visible: false

            Text
            {
                id: bubbleText
                visible: false
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: "With cars like these nothing\ncan slow me down baby!"
                font.pixelSize: parent.height/10
            }
        }
    }

    Rectangle
    {
        id: floRidaOnStageWrapper
        anchors.fill: parent
        visible: false
        Image
        {
            id: backgroundStage
            source: "file:///" + AppDir + "/images/floRidaStage.jpg"
            anchors.fill: parent
        }

        Image
        {
            id: floRidaOnStage
            source: "file:///" + AppDir + "/images/floRidaPerson/floRidaStanding.png"
            x: 0
            y: floRidaChorusWrapper.height / 2 - floRidaOnStage.height + floRidaChorusWrapper.height * .12
            height: floRidaChorusWrapper.height * .35
            width: floRidaChorusWrapper.width * .075

            NumberAnimation
            {
                id: floRidaWalkHalfwayXonStage
                target: floRidaOnStage
                properties: "x"
                from: 0
                to: floRidaChorusWrapper.width / 2 - floRidaOnStage.width / 2
                duration: 2800
                running: false
                onRunningChanged:
                {
                    if (running === false)
                    {
                        floRidaOnStage.source = "file:///" + AppDir + "/images/floRidaPerson/floRidaSinging.png"
                        floRidaOnStage.width = 1.75 * floRidaChorusWrapper.width * .075
                        floRidaOnStage.x = floRidaChorusWrapper.width * .44375
                        floRidaOnStage.y = floRidaChorusWrapper.height * .28
                        floRidaOnStage.height = floRidaChorusWrapper.height * .38
                        floRidaSinging.visible = true
                        firstSetOfLyrics.visible = true
                        tooLoudTimerEnd.start()
                    }
                }
            }
            NumberAnimation
            {
                id: floRidaWalkAllTheWayOffStage
                target: floRidaOnStage
                properties: "x"
                from: floRidaChorusWrapper.width / 2 - floRidaOnStage.width / 2
                to: floRidaChorusWrapper.width
                duration: 2800
                running: false
                onRunningChanged:
                {
                    if (running === false)
                    {
                        floRidaOnStageWrapper.visible = false
                        dancingSceneWrapper.visible = true
                        endOfMattText.start()
                    }
                }
            }
        }
        Image
        {
            id: floRidaSinging
            source: "file:///" + AppDir + "/images/speechBubble.png"
            width: parent.width / 5
            height: parent.height / 5
            x: floRidaOnStage.x + floRidaOnStage.width - floRidaChorusWrapper.width * .00625
            y: floRidaOnStage.y - floRidaChorusWrapper.height * .06
            visible: false

            Text
            {
                id: firstSetOfLyrics
                visible: false
                color: "blue"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: "Play that music\ntoooooo loud!"
                font.pixelSize: parent.height/8
            }

            Text
            {
                id: secondSetOfLyrics
                visible: false
                color: "red"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: "Show me what you\n  doooooo now!"
                font.pixelSize: parent.height/8
            }

            Text
            {
                id: thirdSetOfLyrics
                visible: false
                color: "purple"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: "We don't have to\ngooooo ouuuuttt!"
                font.pixelSize: parent.height/8
            }
        }
    }
    Timer
    {
        id: tooLoudTimerEnd
        interval: 2200
        running: false
        onTriggered:
        {
            firstSetOfLyrics.visible = false
            secondSetOfLyrics.visible = true
            doNowTimerEnd.start()
        }
    }

    Timer
    {
        id: doNowTimerEnd
        interval: 2600
        running: false
        onTriggered:
        {
            secondSetOfLyrics.visible = false
            thirdSetOfLyrics.visible = true
            goOutTimerEnd.start()
        }
    }

    Timer
    {
        id: goOutTimerEnd
        interval: 3000
        running: false
        onTriggered:
        {
            thirdSetOfLyrics.visible = false
            floRidaSinging.visible = false
            floRidaOnStage.source = "file:///" + AppDir + "/images/floRidaPerson/floRidaStanding.png"
            floRidaOnStage.height = floRidaChorusWrapper.height * .35
            floRidaOnStage.width = floRidaChorusWrapper.width * .075
            floRidaOnStage.x = floRidaChorusWrapper.width / 2 - floRidaOnStage.width / 2
            floRidaOnStage.y = floRidaChorusWrapper.height / 2 - floRidaOnStage.height + floRidaChorusWrapper.height * .12
            floRidaWalkAllTheWayOffStage.start()
        }
    }

    Rectangle
    {
        id: dancingSceneWrapper
        anchors.fill: parent
        visible: false
        AnimatedImage
        {
            id: danceFloor
            source: "file:///" + AppDir + "/images/changingSpotLights.gif"
            anchors.fill: parent
        }

        Image
        {
            id: floRidaOnDanceFloor
            source: "file:///" + AppDir + "/images/floRidaPerson/floRidaStanding.png"
            x: 0
            y: outsideFloRidaHouseWrapper.height * 0.3
            height: outsideFloRidaHouseWrapper.height * 0.44
            width: outsideFloRidaHouseWrapper.width * 0.1
        }

       Image
       {
            id: mattOnDanceFloor
            source: "file:///" + AppDir + "/images/mattPerson/mattStanding.png"
            x: outsideFloRidaHouseWrapper.width * 0.625
            y: outsideFloRidaHouseWrapper.height * 0.3
            height: outsideFloRidaHouseWrapper.height * 0.44
            width: .34 * height
       }

       Image
       {
           id: molliOnDanceFloor
           source: "file:///" + AppDir + "/images/molliPerson/molliStanding.png"
           height: outsideFloRidaHouseWrapper.height * 0.44
           width: .48 * height
           anchors.right: mattOnDanceFloor.left
           anchors.bottom: mattOnDanceFloor.bottom
       }

       Image
       {
           id: mattSpeechBubble
           source: "file:///" + AppDir + "/images/speechBubble.png"
           width: parent.width / 5
           height: parent.height / 5
           x: mattOnDanceFloor.x + mattOnDanceFloor.width - floRidaChorusWrapper.width * .00625
           y: mattOnDanceFloor.y - floRidaChorusWrapper.height * .06
           visible: true

           Text
           {
               id: mattLine
               visible: true
               anchors.horizontalCenter: parent.horizontalCenter
               anchors.verticalCenter: parent.verticalCenter
               text: "Aye, yo, Flo Rida,\n  what it do?"
               font.pixelSize: parent.height/8
           }
       }

       Image
       {
           id: floRidaSpeechBubble
           source: "file:///" + AppDir + "/images/speechBubble.png"
           width: parent.width / 5
           height: parent.height / 5
           x: floRidaOnDanceFloor.x + floRidaOnDanceFloor.width - floRidaChorusWrapper.width * .00625
           y: floRidaOnDanceFloor.y - floRidaChorusWrapper.height * .06
           visible: false

           Text
           {
               id: floRidaLine1
               visible: true
               anchors.horizontalCenter: parent.horizontalCenter
               anchors.verticalCenter: parent.verticalCenter
               text: "Just got done with the\nperformance of my life!"
               font.pixelSize: parent.height/9
           }

           Text
           {
               id: floRidaLine2
               visible: false
               anchors.horizontalCenter: parent.horizontalCenter
               anchors.verticalCenter: parent.verticalCenter
               text: "Come on! Lets dance!"
               font.pixelSize: parent.height/8
           }

           Text
           {
               id: floRidaLine3
               visible: false
               anchors.horizontalCenter: parent.horizontalCenter
               anchors.verticalCenter: parent.verticalCenter
               text: "It's my house!"
               color: "red"
               font.bold: true
               font.pixelSize: parent.height/5
           }
       }

       NumberAnimation
       {
           id: floRidaWalkToDanceFloor
           target: floRidaOnDanceFloor
           properties: "x"
           from: 0
           to: floRidaChorusWrapper.width / 3
           duration: 2000
           running: false
           onRunningChanged:
           {
               if (running === false)
               {
                   mattOnDanceFloor.visible = false
                   molliOnDanceFloor.visible = false
                   floRidaOnDanceFloor.visible = false
                   mattDancing.playing = true
                   mattDancing.visible = true
                   molliDancing.playing = true
                   molliDancing.visible = true
                   floRidaDancing.visible = true
                   floRidaDancing.playing = true
               }
           }
       }

        AnimatedImage
        {
            id: mattDancing
            source: "file:///" + AppDir + "/images/mattPerson/dancingGifMatt.gif"
            width: mattOnDanceFloor.height / 2
            height: mattOnDanceFloor.height
            x: mattOnDanceFloor.x
            y: mattOnDanceFloor.y
            playing: false
            visible: false
        }

        AnimatedImage
        {
            id: molliDancing
            source: "file:///" + AppDir + "/images/molliPerson/dancingGifMolli.gif"
            width: molliOnDanceFloor.width
            height: molliOnDanceFloor.height
            x: molliOnDanceFloor.x
            y: molliOnDanceFloor.y
            playing: false
            visible: false
        }

        AnimatedImage
        {
            id: floRidaDancing
            source: "file:///" + AppDir + "/images/floRidaPerson/floRidaDancingGif2.gif"
            width: floRidaOnDanceFloor.width
            height: floRidaOnDanceFloor.height
            x: floRidaOnDanceFloor.x
            y: floRidaOnDanceFloor.y
            playing: false
            visible: false
        }
    }

    Timer
    {
        id: endOfMattText
        interval: 2000
        running: false
        onTriggered:
        {
            mattSpeechBubble.visible = false
            floRidaSpeechBubble.visible = true
            endOfFloRidaLine1.start()
        }
    }

    Timer
    {
        id: endOfFloRidaLine1
        interval: 2000
        running: false
        onTriggered:
        {
            floRidaLine1.visible = false
            floRidaLine2.visible = true
            endOfFloRidaLine2.start()
        }
    }

    Timer
    {
        id: endOfFloRidaLine2
        interval: 2000
        running: false
        onTriggered:
        {
            floRidaSpeechBubble.visible = false
            floRidaLine2.visible = false
            floRidaWalkToDanceFloor.running = true
            itsMyHouse.start()
        }
    }

    Timer
    {
        id: itsMyHouse
        interval:6500
        running: false
        onTriggered:
        {
            floRidaSpeechBubble.visible = true
            floRidaSpeechBubble.mirror = true
            floRidaSpeechBubble.x = floRidaDancing.x - floRidaDancing.width - floRidaDancing.width
            floRidaLine3.visible = true
            triggerCredits.start()
        }
    }

    Timer
    {
        id: triggerCredits
        interval: 2000
        running: false
        onTriggered:
        {
            endScene()
        }
    }

}
