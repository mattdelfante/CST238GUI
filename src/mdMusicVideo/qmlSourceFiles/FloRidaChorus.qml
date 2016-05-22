import QtQuick 2.0

Rectangle
{
    signal endScene
    id: floRidaChorusWrapper
    anchors.fill: parent

    Connections
    {
        id: connectionTimer
        target: MyTimer
        onTimerTimeout:
        {
            if (totalTimeElapsed === 154700)
            {
                outsideFloRidaHouseWrapper.visible = false
                garageSceneWrapper.visible = true
                floRidaWalkHalfwayX.running = true
            }

            else if (totalTimeElapsed === 167300)
            {
                firstSetOfLyrics.visible = false
                secondSetOfLyrics.visible = true
            }

            else if (totalTimeElapsed === 169900)
            {
                secondSetOfLyrics.visible = false
                thirdSetOfLyrics.visible = true
            }

            else if (totalTimeElapsed === 172900)
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

            else if (totalTimeElapsed === 177700)
            {
                mattSpeechBubble.visible = false
                floRidaSpeechBubble.visible = true
            }

            else if (totalTimeElapsed === 179700)
            {
                floRidaLine1.visible = false
                floRidaLine2.visible = true
            }

            else if (totalTimeElapsed === 181700)
            {
                floRidaSpeechBubble.visible = false
                floRidaLine2.visible = false
                floRidaWalkToDanceFloor.running = true
            }

            else if (totalTimeElapsed === 188200)
            {
                floRidaSpeechBubble.visible = true
                floRidaSpeechBubble.mirror = true
                floRidaSpeechBubble.x = floRidaDancing.x - floRidaDancing.width - floRidaDancing.width
                floRidaLine3.visible = true
            }

            else if (totalTimeElapsed === 191200)
            {
                endScene()
            }
        }
    }

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
            interval: 2800
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
                duration: 2600
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
               text: "Come on! Let's dance!"
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
}
