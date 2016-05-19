import QtQuick 2.0

Rectangle
{
    signal endScene
    id: mattChorusWrapper
    anchors.fill: parent

    Connections
    {
        id: connectionTimer
        target: MyTimer
        onTimerTimeout:{
            //End chorus intro field, Begin Matt grow up stairs & Macklemore first text
            if (totalTimeElapsed === 42100)
            {
                outsideOfHouseWrapper.visible = false
                livingRoomWrapper.visible = true
                mattWalkUpStairsY.running = true
                mattWalkUpStairsX.running = true
                mattShrinkUpStairs.running = true
            }
            //End Matt grow up stairs & Macklemore first text, Begin Macklemore second text
            else if (totalTimeElapsed === 48000)
            {
                firstTextBubble.visible = false
                secondTextBubble.visible = true
            }
            //End Macklemore second text, Begin Matt leave Macklemore, shrink stairs & walk hall
            else if (totalTimeElapsed === 51500)
            {
                secondTextBubble.visible = false
                speechBubble.visible = false
                mattWalkAwayFromMack.start()
            }
            //End Matt leave Macklemore, shrink stairs & walk hall, Begin Matt shrink hall & running bases
            else if (totalTimeElapsed === 58400)
            {
                mattShrinkDownHallway.running = true    //trigger animation
            }
            //End Matt shrink hall & running bases, Transition scenes
            else if (totalTimeElapsed === 71600)
            {
                endOfChorusSceneWrapper.visible = false
                endScene()
            }
        }
    }

    Rectangle
    {
        id: outsideOfHouseWrapper
        visible: true
        anchors.fill: parent

        Image
        {
            id: mattChorusHouse
            source: "file:///" + AppDir + "/images/mattChorusHouse.png"
            anchors.fill: parent
        }

        Text
        {
            id: houseText
            visible: true
            text: "Matt's House"
            color: "red"
            font.family: "Monotype Corsiva"
            font.pixelSize: parent.height /9
            x: outsideOfHouseWrapper.width * .5
            y: outsideOfHouseWrapper.height * .2
        }
    }

    Rectangle
    {
        id: livingRoomWrapper
        visible: false
        anchors.fill: parent

        Image
        {
            id: mattLivingRoomStairs
            source: "file:///" + AppDir + "/images/mattLivingRoom.jpg"
            anchors.fill: parent

            Image
            {
                id: mattWalkStairs
                source: "file:///" + AppDir + "/images/mattPerson/mattStanding.png"
                width: height * .345
                height: parent.height * .464
                x: 0
                y: livingRoomWrapper.height / 3
                visible: true

                //walking up the stairs
                NumberAnimation
                {
                    id: mattWalkUpStairsY
                    target: mattWalkStairs
                    properties: "y"
                    from: livingRoomWrapper.height / 3
                    to: .04 * livingRoomWrapper.height
                    duration: 2400
                    running: false
                }
                NumberAnimation
                {
                    id: mattWalkUpStairsX
                    target: mattWalkStairs
                    properties: "x"
                    from: 0
                    to: livingRoomWrapper.width / 5
                    duration: 2400
                    running: false
                }
                PropertyAnimation
                {
                    id: mattShrinkUpStairs
                    target: mattWalkStairs
                    properties: "height"
                    from: livingRoomWrapper.height * .464
                    to: livingRoomWrapper.height * .32
                    duration: 2400
                    running: false

                    onRunningChanged:
                    {
                         if (running === false)
                         {
                             macklemoreScene.visible = true
                         }
                    }
                }

                //walking down the stairs
                NumberAnimation
                {
                    id: mattWalkDownStairsY
                    target: mattWalkStairs
                    properties: "y"
                    from: .03 * livingRoomWrapper.height
                    to: livingRoomWrapper.height / 3
                    duration: 2400
                    running: false
                }
                NumberAnimation
                {
                    id: mattWalkDownStairsX
                    target: mattWalkStairs
                    properties: "x"
                    from: livingRoomWrapper.width / 5
                    to: 0
                    duration: 2400
                    running: false
                }
                PropertyAnimation
                {
                    id: mattGrowDownStairs
                    target: mattWalkStairs
                    properties: "height"
                    from: livingRoomWrapper.height * .32
                    to: livingRoomWrapper.height * .464
                    duration: 2400
                    running: false

                    onRunningChanged:
                    {
                        if (running === false)
                        {
                            mattWalkDownHallwayX.running = true
                            mattWalkDownHallwayY.running = true
                        }
                    }
                }

                //walking down the hallway
                NumberAnimation
                {
                    id: mattWalkDownHallwayX
                    target: mattWalkStairs
                    properties: "x"
                    from: 0
                    to: livingRoomWrapper.width / 2.8
                    duration: 2400
                    running: false
                }
                NumberAnimation
                {
                    id: mattWalkDownHallwayY
                    target: mattWalkStairs
                    properties: "y"
                    from: livingRoomWrapper.height / 3
                    to: .44 * livingRoomWrapper.height
                    duration: 2400
                    running: false
                }
                PropertyAnimation
                {
                    id: mattShrinkDownHallway
                    target: mattWalkStairs
                    properties: "height"
                    from: livingRoomWrapper.height * .464
                    to: livingRoomWrapper.height * .16
                    duration: 1200
                    running: false
                    onRunningChanged:
                    {
                        //this triggers going from the living room
                        //to running around the bases outside
                        if (running === false)
                        {
                            livingRoomWrapper.visible = false
                            endOfChorusSceneWrapper.visible = true
                            baseballRunningAnimation.running = true
                        }
                    }
                }
            }
        }
    }

    Rectangle
    {
        id: macklemoreScene
        visible: false
        anchors.fill: parent
        Image
        {
            id: macklemore
            source: "file:///" + AppDir + "/images/macklemore.jpg"
            anchors.fill: parent
        }
        AnimatedImage
        {
            id: dancingMatt
            width: parent.width/7
            height: parent.height / 1.25
            visible: true
            source: "file:///" + AppDir + "/images/mattPerson/dancingGifMatt.gif"
            y: outsideOfHouseWrapper.height - height
            x: 0
        }

        Image
        {
            id: speechBubble
            source: "file:///" + AppDir + "/images/speechBubble.png"
            visible: true
            width: parent.width / 4
            height: parent.height / 4
            x: dancingMatt.x + dancingMatt.width -20
            y: dancingMatt.y

            Text
            {
                id: firstTextBubble
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: "Macklemore Performs at\nmy house twice a week!"
                font.pixelSize: parent.height/10
            }

            Text
            {
                id: secondTextBubble
                visible: false
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset:-10
                text: "He loves to let me sing\nthe chorus of Downtown!\nDowwnnntowwwnnnn!!!"
                font.pixelSize: parent.height/10
            }
        }
        NumberAnimation
        {
            id: mattWalkAwayFromMack
            target: dancingMatt
            properties: "x"
            from: 0
            to: outsideOfHouseWrapper.width
            duration: 3200
            running: false

            onRunningChanged:
            {
                if (running === false)
                {
                    macklemoreScene.visible = false
                    mattWalkDownStairsX.running = true
                    mattWalkDownStairsY.running = true
                    mattGrowDownStairs.running = true
                }
            }
        }
    }

    Rectangle
    {
        id: endOfChorusSceneWrapper
        visible: false
        anchors.fill: parent
        Image
        {
            id: baseballField
            anchors.fill: parent
            visible: true
            source: "file:///" + AppDir + "/images/chorusBaseballField.jpg"
        }

        //handles running around the bases
        SequentialAnimation
        {
            id: baseballRunningAnimation
            running: false

            PauseAnimation
            {
                duration: 500
            }

            PathAnimation
            {
                id: homeToFirst
                duration: 2000
                target: dancingBaseballMatt
                anchorPoint: Qt.point(dancingBaseballMatt.width/2, dancingBaseballMatt.height/2)
                path: Path {
                    PathLine
                    {
                        x: endOfChorusSceneWrapper.width * .875
                        y: endOfChorusSceneWrapper.height * .5
                    }
                }
            }
            PathAnimation
            {
                id: firstToSecond
                duration: 2000
                target: dancingBaseballMatt
                anchorPoint: Qt.point(dancingBaseballMatt.width/2, dancingBaseballMatt.height/2)
                path: Path {
                    PathLine
                    {
                        x: endOfChorusSceneWrapper.width * .5
                        y: endOfChorusSceneWrapper.height * .3
                    }
                }
            }
            PathAnimation
            {
                id: secodToThird
                duration: 2000
                target: dancingBaseballMatt
                anchorPoint: Qt.point(dancingBaseballMatt.width/2, dancingBaseballMatt.height/2)
                path: Path {
                    PathLine
                    {
                        x: endOfChorusSceneWrapper.width * .1125
                        y: endOfChorusSceneWrapper.height * .54
                    }
                }
            }
            PathAnimation
            {
                id: thirdToHome
                duration: 2000
                target: dancingBaseballMatt
                anchorPoint: Qt.point(dancingBaseballMatt.width/2, dancingBaseballMatt.height/2)
                path: Path {
                    PathLine
                    {
                        x: endOfChorusSceneWrapper.width * .5125
                        y: endOfChorusSceneWrapper.height * .88
                    }
                }
            }

            PauseAnimation
            {
                duration: 1000
            }
            onRunningChanged:
            {
                if (baseballRunningAnimation.running === false)
                {
                    finalText.visible = true
                }
            }
        }

        AnimatedImage
        {
            id: dancingBaseballMatt
            width: parent.width/16
            height: parent.height * .2
            visible: true
            source: "file:///" + AppDir + "/images/mattPerson/dancingGifMatt.gif"
            y: endOfChorusSceneWrapper.height - height * 1.1
            x: endOfChorusSceneWrapper.width / 2.09
        }

        Text
        {
            id: finalText
            visible: false
            anchors.horizontalCenter: endOfChorusSceneWrapper.horizontalCenter
            anchors.verticalCenter: endOfChorusSceneWrapper.verticalCenter
           anchors.verticalCenterOffset: -endOfChorusSceneWrapper.height / 3
            color: "red"
            text: "Welcome To My House"
            font.pixelSize: endOfChorusSceneWrapper.height / 8
            font.family: "Monotype Corsiva"
        }
    }
}
