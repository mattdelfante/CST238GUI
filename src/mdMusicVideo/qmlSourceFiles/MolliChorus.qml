import QtQuick 2.0

Rectangle {
    //REMOVE
    property alias timer1:timer1

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
            molliWalking.visible = true
            molliWalking.x = 525
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
            molliWalking.visible = false
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
                        bouncingUp.start()
                    }
                    else
                    {
                        bouncingUp.from = 275
                        bouncingUp.to = 240
                        bouncingUp.start()
                    }
                }
            }
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
            id: walkingInLivingRoom1Y
            target: molliWalking
            properties: "y"
            from: 150
            to: 250
            duration: 2500
            running: false
        }

        PropertyAnimation{
            id: growingInLivingRoom
            target: molliWalking
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
            target: molliWalking
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
                    molliWalking.y = 250
                    walkingInLivingRoom2X.start()
                }
            }
        }

        NumberAnimation{
            id: walkingInLivingRoom2X
            target: molliWalking
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
                    walkingInPetRoomY.start()
                    walkingInPetRoomX.start()
                    shrinkingInPetRoom.start()
                    timer5.start()
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
            from: 0
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
    }
}



