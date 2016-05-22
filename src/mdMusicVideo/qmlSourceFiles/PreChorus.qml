import QtQuick 2.0
import QtQuick.Window 2.2
import QtMultimedia 5.5
import QtQuick.Particles 2.0

Rectangle
{
    signal endScene
    id: window
    anchors.fill: parent

    Connections{
        id: connectionTimer
        target: MyTimer
        onTimerTimeout:{
            //Reset certain values for second usage of PreChorus component
            if (totalTimeElapsed === 90000)
            {
                gottaStayIn.visible = true
                raining.enabled = true
                mapAnimationHeight.running = true
                mapAnimationWidth.running = true
            }
            //End gotta stay in, Begin map zoom
            else if (totalTimeElapsed === 32500 || totalTimeElapsed === 93500)
            {
                gottaStayIn.visible = false
                mapZoomAndDancing.visible = true
            }

            //Begin dancing on map zoom
            else if (totalTimeElapsed === 35000 || totalTimeElapsed === 96000)
            {
                dancingMatt.visible = true
                dancingMolli.visible = true
            }

            //End dancing and map zoom, Begin gotta stay in in
            else if (totalTimeElapsed === 37500 || totalTimeElapsed === 98500)
            {
                mapZoomAndDancing.visible = false
                mapAnimationHeight.running = false
                mapAnimationWidth.running = false
                dancingMatt.visible = false
                dancingMolli.visible = false
                gottaStayIn.visible = true
                gottaStayInIn.visible = true
            }

            //Small IN text visible
            else if (totalTimeElapsed === 38800 || totalTimeElapsed === 100000)
            {
                smallerIN.visible = true
            }

            //Smaller IN text invisible, bigger IN text visible
            else if (totalTimeElapsed === 39300 || totalTimeElapsed === 100500)
            {
                smallerIN.visible = false
                biggerIN.visible = true
            }

            //End gotta stay in in, bigger IN text invisible, Transition scenes
            else if (totalTimeElapsed === 40000 || totalTimeElapsed === 101200)
            {
                gottaStayIn.visible = false
                raining.enabled = false
                gottaStayInIn.visible = false
                biggerIN.visible = false
                endScene()
            }
        }
    }

    Rectangle
    {
        id: gottaStayIn
        anchors.fill:parent

        Rectangle
        {
            id: houseImageWrapper
            anchors.fill: parent
            color:"#3a6484"
            Image
            {
                id: rainyHouse
                source: "file:///" + AppDir + "/images/faceHouseClouds.png"
                anchors.fill: parent
            }
        }

        ParticleSystem
        {
            id: particles
        }
        ImageParticle
        {
            source: "file:///" + AppDir + "/images/raindrop.png"
            system: particles
        }

        Emitter
        {
            id: raining
            system: particles
            emitRate: 30
            lifeSpan: 7000
            velocity: PointDirection { y:40; yVariation: 40; }
            acceleration: PointDirection { y: 80 }
            size: 15
            width: parent.width
            height: .2 * parent.height
            enabled: true
        }
    }

    Rectangle{
        id: mapZoomAndDancing
        anchors.fill: parent
        visible: false
        color: "#a6a6a6"

        Image
        {
            id: washingtonMap
            source: "file:///" + AppDir + "/images/washingtonMap.png"
            x: parent.width / 2 - (width / 2)
            y: parent.height / 2 - (height / 2)
            height: window.height /2
            width: window.width / 2

            PropertyAnimation
            {
                id: mapAnimationHeight
                target: washingtonMap
                properties: "height"
                from: 250
                to: 500
                duration: 1000
                running: true

                onRunningChanged:
                {
                    if (washingtonMap.height === 500)
                    {
                        mapAnimationHeight.from = 500
                        mapAnimationHeight.to = 250
                        mapAnimationHeight.start()
                    }
                    else if (washingtonMap.height === 250)
                    {
                        mapAnimationHeight.from = 250
                        mapAnimationHeight.to = 500
                        mapAnimationHeight.start()
                    }
                }
            }

            PropertyAnimation
            {
                id: mapAnimationWidth
                target: washingtonMap
                properties: "width"
                from: 400
                to: 800
                duration: 1000
                running: true

                onRunningChanged:
                {
                    if (washingtonMap.width === 800)
                    {
                        mapAnimationWidth.from = 800
                        mapAnimationWidth.to = 400
                        mapAnimationWidth.start()
                    }
                    else if (washingtonMap.width === 400)
                    {
                        mapAnimationWidth.from = 400
                        mapAnimationWidth.to = 800
                        mapAnimationWidth.start()
                    }
                }
            }
        }

        AnimatedImage
        {
            id: dancingMatt
            width: parent.width/5
            height: parent.height/1.5
            visible: false
            source: "file:///" + AppDir + "/images/mattPerson/dancingGifMatt.gif"
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
        }

        AnimatedImage
        {
            id: dancingMolli
            width: parent.width/5
            height: parent.height/1.5
            visible: false
            source: "file:///" + AppDir + "/images/molliPerson/dancingGifMolli.gif"
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Rectangle
    {
        id: gottaStayInIn
        visible: false
        anchors.fill: parent
        color: "transparent"

        Text
        {
            id: smallerIN
            visible: false
            text: "IN"
            color: "red"
            font.family: "Monotype Corsiva"
            font.pixelSize: parent.height /4
            x: rainyHouse.width / 2 - width / 2
            y: rainyHouse.height / 2 - height/ 3
        }

        Text
        {
            id: biggerIN
            visible: false
            text: "IN"
            color: "red"
            font.family: "Monotype Corsiva"
            font.pixelSize: parent.height /2
            x: rainyHouse.width / 2 - width / 2
            y: rainyHouse.height / 2 - height/ 3
        }
    }
}

