import QtQuick 2.0

Rectangle {
    //REMOVE
    property alias timer1:timer1

    signal endScene
    property int jumpCount: 0
    id: window
    anchors.fill: parent

    Timer{
        id: timer1
        interval: 2700
        running: false

        onTriggered: {
            outsideBeachHouse.visible = false
            modernBedroom.visible = true
            molliWalking.visible = true
            molliWalking.y = window.height/2.85
            walkingOutBedroomX.start()
        }
    }

    Timer{
        id: timer3
        interval: 2700
        running: false

        onTriggered: {
            loungeBeachside.visible = false
            modernLivingRoom.visible = true
            molliDancing.x = 525
            molliDancing.visible = true
            walkingInLivingRoom1Y.start()
            growingInLivingRoom.start()
        }
    }

    Timer{
        id: timer5
        interval: 1500
        running: false

        onTriggered:{
            followingMolliY.start()
            followingMolliX.start()
            shrinkingBehindMolli.start()
        }
    }

    Timer{
        id: timer6
        interval: 3000
        running: false

        onTriggered: {
            petDaycare.visible = false
            waterAndDock.visible = true
            molliWalking.mirror = true
            molliWalking.y = 160
            walkingOnDock.start()
        }
    }

    Timer{
        id: timer7
        interval: 2200
        running: false

        onTriggered: {
            endScene()
        }
    }

    Image{
        id: outsideBeachHouse
        source: "file:///" + AppDir + "/images/molliChorusHouse.jpg"
        anchors.fill: parent

        Text{
            id: molliHouse
            text: "Molli's House"
            color: "red"
            font.family: "Monotype Corsiva"
            font.pixelSize: parent.height /9
            x: parent.width/2
            y: parent.height/30
        }
    }

    Image{
        id: modernBedroom
        source: "file:///" + AppDir + "/images/modernBedroom.jpg"
        anchors.fill: parent
        visible: false
    }

    Image{
        id: loungeBeachside
        source: "file:///" + AppDir + "/images/loungeBeachside.jpg"
        anchors.fill: parent
        visible: false

        Image{
            id: molliLayingHammock
            source: "file:///" + AppDir + "/images/molliPerson/molliLaying.png"
            width: 173
            height: 93
            x: window.width/10
            y: window.height/2.1
            visible: false
        }
    }

    Image{
        id: modernLivingRoom
        source: "file:///" + AppDir + "/images/modernLivingRoom.jpg"
        anchors.fill: parent
        visible: false
    }

    Image{
        id: modernLivingRoom2
        source: "file:///" + AppDir + "/images/modernLivingRoom2.jpg"
        anchors.fill: parent
        visible: false
    }

    Image{
        id: petDaycare
        source: "file:///" + AppDir + "/images/petDaycare.jpg"
        anchors.fill: parent
        visible: false
    }

    Image{
        id: westieFollowingMolli
        source: "file:///" + AppDir + "/images/westie.png"
        width: 150
        height: width
        x: -100
        y: 500

        NumberAnimation{
            id: followingMolliY
            target: westieFollowingMolli
            properties: "y"
            from: 500
            to: 275
            duration: 1500
            running: false
        }

        NumberAnimation{
            id: followingMolliX
            target: westieFollowingMolli
            properties: "x"
            from: -100
            to: 245
            duration: 1500
            running: false
        }

        PropertyAnimation{
            id: shrinkingBehindMolli
            target: westieFollowingMolli
            properties: "width"
            from: 150
            to: 100
            duration: 1500
            running: false

            onRunningChanged:{
                if (running === false)
                {
                    bouncingUp.start()
                    timer6.start()
                }
            }
        }

        NumberAnimation{
            id: bouncingUp
            target: westieFollowingMolli
            properties: "y"
            from: 275
            to: 240
            duration: 500
            running: false

            onRunningChanged: {
                if (westieFollowingMolli.y === 240)
                {
                    bouncingUp.from = 240
                    bouncingUp.to = 275
                    if (jumpCount != 3 && running != true)
                    {
                        jumpCount++
                        bouncingUp.start()
                    }
                }
                else
                {
                    bouncingUp.from = 275
                    bouncingUp.to = 240
                    if (jumpCount != 3)
                        bouncingUp.start()
                }
            }
        }

        NumberAnimation{
            id: runningOnDock
            target: westieFollowingMolli
            properties: "x"
            from: 750
            to: 385
            duration: 2500
            running: false

            onRunningChanged: {
                if (running === false)
                {
                    //jump dog off dock
                    dogJumpsIntoWaterX.start()
                    dogJumpsIntoWaterY.start()
                }
            }
        }

        NumberAnimation{
            id: dogJumpsIntoWaterX
            target: westieFollowingMolli
            properties: "x"
            from: 385
            to: 100
            duration: 2000
            running: false
        }

        NumberAnimation{
            id: dogJumpsIntoWaterY
            target: westieFollowingMolli
            properties: "y"
            from: 250
            to: 225
            duration: 700
            running: false

            onRunningChanged: {
                if(running === false)
                {
                    dogLandsInWaterY.start()
                    molliDiving.mirror = true
                    molliDiving.rotation = 0
                    molliInWater.start()
                    timer7.start()
                }
            }
        }

        NumberAnimation{
            id: dogLandsInWaterY
            target: westieFollowingMolli
            properties: "y"
            from: 225
            to: 300
            duration: 1300
            running: false
        }
    }

    Rectangle{
        id: waterAndDock
        anchors.fill: parent
        visible: false

        Image{
            id: waterBackLayer
            source: "file:///" + AppDir + "/images/waterBackLayer.png"
            anchors.fill: parent
        }

        Image{
            id: molliDiving
            source: "file:///" + AppDir + "/images/molliPerson/molliDiving.png"
            width: height/2
            height: 200
            x: 385
            y: 160
            visible: false

            NumberAnimation{
                id: jumpOffDockX
                target: molliDiving
                properties: "x"
                from: 385
                to: 50
                duration: 2500
                running: false
            }

            NumberAnimation{
                id: jumpOffDockY
                target: molliDiving
                properties: "y"
                from: 160
                to: 125
                duration: 1000
                running: false

                onRunningChanged: {
                    if (running === false)
                    {
                        diveIntoWaterY.start()
                    }
                }
            }

            NumberAnimation{
                id: diveIntoWaterY
                target: molliDiving
                properties: "y"
                from: 125
                to: 390
                duration: 1500
                running: false
            }

            PropertyAnimation{
                id: rotationDiving
                target: molliDiving
                properties: "rotation"
                from: 0
                to: -160
                duration: 2500
                running: false
            }

            NumberAnimation{
                id: molliInWater
                target: molliDiving
                properties: "y"
                from: 390
                to: 300
                duration: 400
                running: false
            }
        }

        Image{
            id: waterFrontLayer
            source: "file:///" + AppDir + "/images/waterFrontLayer.png"
            anchors.fill: parent
        }
    }

    Image{
        id: molliWalking
        source: "file:///" + AppDir + "/images/molliPerson/molliStanding.png"
        width: height/2
        height: 200
        visible: false

        NumberAnimation{
            id: walkingOutBedroomX
            target: molliWalking
            properties: "x"
            from: window.width/3
            to: window.width/25
            duration: 2500
            running: false

            onRunningChanged:{
                if (running === false)
                {
                    modernBedroom.visible = false
                    loungeBeachside.visible = true
                    walkingOntoPorchY.start()
                }
            }
        }

        NumberAnimation{
            id: walkingOntoPorchY
            target: molliWalking
            properties: "y"
            from: window.height/2 + window.height/4
            to: window.height/2
            duration: 1700
            running: false

            onRunningChanged:{
                if (running === false)
                    pausedOnPorch.start()
            }
        }

        PauseAnimation {
            id: pausedOnPorch
            duration: 800
            running: false

            onRunningChanged: {
                if (running === false)
                {
                    molliLayingHammock.visible = true
                    molliWalking.visible = false
                    timer3.start()
                }
            }
        }

        NumberAnimation{
            id: walkingInPetRoomY
            target: molliWalking
            properties: "y"
            from: 250
            to: 150
            duration: 2500
            running: false
        }

        NumberAnimation{
            id: walkingInPetRoomX
            target: molliWalking
            properties: "x"
            from: -50
            to: 350
            duration: 2500
            running: false
        }

        PropertyAnimation{
            id: shrinkingInPetRoom
            target: molliWalking
            properties: "height"
            from: 250
            to: 200
            duration: 2500
            running: false
        }

        NumberAnimation{
            id: walkingOnDock
            target: molliWalking
            properties: "x"
            from: 700
            to: 385
            duration: 2000
            running: false

            onRunningChanged: {
                if (running === false)
                {
                    molliWalking.visible = false
                    molliDiving.visible = true
                    jumpOffDockX.start()
                    jumpOffDockY.start()
                    rotationDiving.start()
                    westieFollowingMolli.y = 250
                    westieFollowingMolli.z = 5
                    westieFollowingMolli.mirror = true
                    runningOnDock.start()
                }
            }
        }
    }

    AnimatedImage{
        id: molliDancing
        source: "file:///" + AppDir + "/images/molliPerson/dancingGifMolli.gif"
        width: height/2
        height: 200
        visible: false

        NumberAnimation{
            id: walkingInLivingRoom1Y
            target: molliDancing
            properties: "y"
            from: 150
            to: 255
            duration: 2500
            running: false
        }

        PropertyAnimation{
            id: growingInLivingRoom
            target: molliDancing
            properties: "height"
            from: 200
            to: 250
            duration: 2500
            running: false

            onRunningChanged: {
                if (running === false)
                {
                    walkingInLivingRoom1X.start()
                }
            }
        }

        NumberAnimation{
            id: walkingInLivingRoom1X
            target: molliDancing
            properties: "x"
            from: 525
            to: 0
            duration: 2500
            running: false

            onRunningChanged:{
                if (running === false)
                {
                    modernLivingRoom.visible = false
                    modernLivingRoom2.visible = true
                    walkingInLivingRoom2X.start()
                }
            }
        }


        NumberAnimation{
            id: walkingInLivingRoom2X
            target: molliDancing
            properties: "x"
            from: 600
            to: 0
            duration: 2500
            running: false

            onRunningChanged: {
                if (running === false)
                {
                    modernLivingRoom2.visible = false
                    petDaycare.visible = true
                    molliDancing.visible = false
                    molliWalking.visible = true
                    walkingInPetRoomY.start()
                    walkingInPetRoomX.start()
                    shrinkingInPetRoom.start()
                    timer5.start()
                }
            }
        }
    }
}



