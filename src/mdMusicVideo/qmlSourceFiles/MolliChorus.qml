import QtQuick 2.0

Rectangle {
    signal endScene
    property int jumpCount: 0
    id: window
    anchors.fill: parent

    Connections
    {
        id: connectionTimer
        target: MyTimer
        onTimerTimeout:
        {
            if (totalTimeElapsed === 103400)
            {
                outsideBeachHouse.visible = false
                modernBedroom.visible = true
                molliWalking.visible = true
                molliWalking.y = window.height/2.85
                walkingOutBedroomX.start()
            }

            else if (totalTimeElapsed === 111100)
            {
                loungeBeachside.visible = false
                modernLivingRoom.visible = true
                molliDancing.x = .65625 * window.width
                molliDancing.visible = true
                walkingInLivingRoom1Y.start()
                growingInLivingRoom.start()
            }

            else if (totalTimeElapsed === 120100)
            {
                followingMolliY.start()
                followingMolliX.start()
                shrinkingBehindMolli.start()
            }

            else if (totalTimeElapsed === 124600)
            {
                petDaycare.visible = false
                waterAndDock.visible = true
                molliWalking.mirror = true
                molliWalking.y = .32 * window.height
                walkingOnDock.start()
            }

            else if (totalTimeElapsed === 132200)
            {
                endScene()
            }
        }
    }

    Image
    {
        id: outsideBeachHouse
        source: "file:///" + AppDir + "/images/molliChorusHouse.jpg"
        anchors.fill: parent

        Text
        {
            id: molliHouse
            text: "Molli's House"
            color: "red"
            font.family: "Monotype Corsiva"
            font.pixelSize: parent.height /9
            x: parent.width/2
            y: parent.height/30
        }
    }

    Image
    {
        id: modernBedroom
        source: "file:///" + AppDir + "/images/modernBedroom.jpg"
        anchors.fill: parent
        visible: false
    }

    Image
    {
        id: loungeBeachside
        source: "file:///" + AppDir + "/images/loungeBeachside.jpg"
        anchors.fill: parent
        visible: false

        Image
        {
            id: molliLayingHammock
            source: "file:///" + AppDir + "/images/molliPerson/molliLaying.png"
            width: .21625 * window.width
            height: .186 * window.height
            x: window.width/10
            y: window.height/2.1
            visible: false
        }
    }

    Image
    {
        id: modernLivingRoom
        source: "file:///" + AppDir + "/images/modernLivingRoom.jpg"
        anchors.fill: parent
        visible: false
    }

    Image
    {
        id: modernLivingRoom2
        source: "file:///" + AppDir + "/images/modernLivingRoom2.jpg"
        anchors.fill: parent
        visible: false
    }

    Image
    {
        id: petDaycare
        source: "file:///" + AppDir + "/images/petDaycare.jpg"
        anchors.fill: parent
        visible: false
    }

    Image
    {
        id: westieFollowingMolli
        source: "file:///" + AppDir + "/images/westie.png"
        width: .1875 * window.width
        height: width
        x: -.125 * window.width
        y: window.height

        NumberAnimation
        {
            id: followingMolliY
            target: westieFollowingMolli
            properties: "y"
            from: window.height
            to: .55 * window.height
            duration: 1500
            running: false
        }

        NumberAnimation
        {
            id: followingMolliX
            target: westieFollowingMolli
            properties: "x"
            from: -.125 * window.width
            to: .30625 * window.width
            duration: 1500
            running: false
        }

        PropertyAnimation
        {
            id: shrinkingBehindMolli
            target: westieFollowingMolli
            properties: "width"
            from: .1875 * window.width
            to: .125 * window.width
            duration: 1500
            running: false

            onRunningChanged:
            {
                if (running === false)
                {
                    bouncingUp.start()
                }
            }
        }

        NumberAnimation
        {
            id: bouncingUp
            target: westieFollowingMolli
            properties: "y"
            from: .55 * window.height
            to: .48 * window.height
            duration: 500
            running: false

            onRunningChanged:
            {
                if (westieFollowingMolli.y === .48 * window.height)
                {
                    bouncingUp.from = .48 * window.height
                    bouncingUp.to = .55 * window.height
                    if (jumpCount != 3 && running != true)
                    {
                        jumpCount++
                        bouncingUp.start()
                    }
                }
                else
                {
                    bouncingUp.from = .55 * window.height
                    bouncingUp.to = .48 * window.height
                    if (jumpCount != 3)
                        bouncingUp.start()
                }
            }
        }

        NumberAnimation
        {
            id: runningOnDock
            target: westieFollowingMolli
            properties: "x"
            from: .9375 * window.width
            to: .48125 * window.width
            duration: 2500
            running: false

            onRunningChanged:
            {
                if (running === false)
                {
                    dogJumpsIntoWaterX.start()
                    dogJumpsIntoWaterY.start()
                }
            }
        }

        NumberAnimation
        {
            id: dogJumpsIntoWaterX
            target: westieFollowingMolli
            properties: "x"
            from: .48125 * window.width
            to: .125 * window.width
            duration: 2000
            running: false
        }

        NumberAnimation
        {
            id: dogJumpsIntoWaterY
            target: westieFollowingMolli
            properties: "y"
            from: .5 * window.height
            to: .45 * window.height
            duration: 700
            running: false

            onRunningChanged:
            {
                if(running === false)
                {
                    dogLandsInWaterY.start()
                    molliDiving.mirror = true
                    molliDiving.rotation = 0
                    molliInWater.start()
                }
            }
        }

        NumberAnimation
        {
            id: dogLandsInWaterY
            target: westieFollowingMolli
            properties: "y"
            from: .45 * window.height
            to: .6 * window.height
            duration: 1300
            running: false
        }
    }

    Rectangle
    {
        id: waterAndDock
        anchors.fill: parent
        visible: false

        Image
        {
            id: waterBackLayer
            source: "file:///" + AppDir + "/images/waterBackLayer.png"
            anchors.fill: parent
        }

        Image
        {
            id: molliDiving
            source: "file:///" + AppDir + "/images/molliPerson/molliDiving.png"
            width: height/2
            height: .4 * window.height
            x: .48125 * window.width
            y: .32 * window.height
            visible: false

            NumberAnimation
            {
                id: jumpOffDockX
                target: molliDiving
                properties: "x"
                from: .48125 * window.width
                to: .0625 * window.width
                duration: 2500
                running: false
            }

            NumberAnimation
            {
                id: jumpOffDockY
                target: molliDiving
                properties: "y"
                from: .32 * window.height
                to: .25 * window.height
                duration: 1000
                running: false

                onRunningChanged:
                {
                    if (running === false)
                    {
                        diveIntoWaterY.start()
                    }
                }
            }

            NumberAnimation
            {
                id: diveIntoWaterY
                target: molliDiving
                properties: "y"
                from: .25 * window.height
                to: .78 * window.height
                duration: 1500
                running: false
            }

            PropertyAnimation
            {
                id: rotationDiving
                target: molliDiving
                properties: "rotation"
                from: 0
                to: -160
                duration: 2500
                running: false
            }

            NumberAnimation
            {
                id: molliInWater
                target: molliDiving
                properties: "y"
                from: .78 * window.height
                to: .6 * window.height
                duration: 400
                running: false
            }
        }

        Image
        {
            id: waterFrontLayer
            source: "file:///" + AppDir + "/images/waterFrontLayer.png"
            anchors.fill: parent
        }
    }

    Image
    {
        id: molliWalking
        source: "file:///" + AppDir + "/images/molliPerson/molliStanding.png"
        width: height/2
        height: .4 * window.height
        visible: false

        NumberAnimation
        {
            id: walkingOutBedroomX
            target: molliWalking
            properties: "x"
            from: window.width/3
            to: window.width/25
            duration: 2400
            running: false

            onRunningChanged:
            {
                if (running === false)
                {
                    modernBedroom.visible = false
                    loungeBeachside.visible = true
                    walkingOntoPorchY.start()
                }
            }
        }

        NumberAnimation
        {
            id: walkingOntoPorchY
            target: molliWalking
            properties: "y"
            from: window.height/2 + window.height/4
            to: window.height/2
            duration: 1800
            running: false

            onRunningChanged:
            {
                if (running === false)
                    pausedOnPorch.start()
            }
        }

        PauseAnimation
        {
            id: pausedOnPorch
            duration: 800
            running: false

            onRunningChanged:
            {
                if (running === false)
                {
                    molliLayingHammock.visible = true
                    molliWalking.visible = false
                }
            }
        }

        NumberAnimation
        {
            id: walkingInPetRoomY
            target: molliWalking
            properties: "y"
            from: .5 * window.height
            to: .3 * window.height
            duration: 2500
            running: false
        }

        NumberAnimation
        {
            id: walkingInPetRoomX
            target: molliWalking
            properties: "x"
            from: -.0625 * window.width
            to: .4375 * window.width
            duration: 2500
            running: false
        }

        PropertyAnimation
        {
            id: shrinkingInPetRoom
            target: molliWalking
            properties: "height"
            from: .5 * window.height
            to: .4 * window.height
            duration: 2500
            running: false
        }

        NumberAnimation
        {
            id: walkingOnDock
            target: molliWalking
            properties: "x"
            from: .875 * window.width
            to: .48125 * window.width
            duration: 2000
            running: false

            onRunningChanged:
            {
                if (running === false)
                {
                    molliWalking.visible = false
                    molliDiving.visible = true
                    jumpOffDockX.start()
                    jumpOffDockY.start()
                    rotationDiving.start()
                    westieFollowingMolli.y = .5 * window.height
                    westieFollowingMolli.z = 5
                    westieFollowingMolli.mirror = true
                    runningOnDock.start()
                }
            }
        }
    }

    AnimatedImage
    {
        id: molliDancing
        source: "file:///" + AppDir + "/images/molliPerson/dancingGifMolli.gif"
        width: height/2
        height: .4 * window.height
        visible: false

        NumberAnimation
        {
            id: walkingInLivingRoom1Y
            target: molliDancing
            properties: "y"
            from: .3 * window.height
            to: .51 * window.height
            duration: 2500
            running: false
        }

        PropertyAnimation
        {
            id: growingInLivingRoom
            target: molliDancing
            properties: "height"
            from: .4 * window.height
            to: .5 * window.height
            duration: 2500
            running: false

            onRunningChanged:
            {
                if (running === false)
                {
                    walkingInLivingRoom1X.start()
                }
            }
        }

        NumberAnimation
        {
            id: walkingInLivingRoom1X
            target: molliDancing
            properties: "x"
            from: .65625 * window.width
            to: 0
            duration: 2500
            running: false

            onRunningChanged:
            {
                if (running === false)
                {
                    modernLivingRoom.visible = false
                    modernLivingRoom2.visible = true
                    walkingInLivingRoom2X.start()
                }
            }
        }


        NumberAnimation
        {
            id: walkingInLivingRoom2X
            target: molliDancing
            properties: "x"
            from: .75 * window.width
            to: 0
            duration: 2500
            running: false

            onRunningChanged:
            {
                if (running === false)
                {
                    modernLivingRoom2.visible = false
                    petDaycare.visible = true
                    molliDancing.visible = false
                    molliWalking.visible = true
                    walkingInPetRoomY.start()
                    walkingInPetRoomX.start()
                    shrinkingInPetRoom.start()
                }
            }
        }
    }
}



