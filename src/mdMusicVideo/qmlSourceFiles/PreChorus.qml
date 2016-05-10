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
            //End gotta stay in, Begin map zoom
            if (totalTimeElapsed === 32500)
            {
                gottaStayIn.visible = false
                mapZoomAndDancing.visible = true
            }

            //Begin dancing on map zoom
            else if (totalTimeElapsed === 35000)
            {
                dancingMatt.visible = true
                dancingMolli.visible = true
            }

            //End dancing and map zoom, Begin gotta stay in in
            else if (totalTimeElapsed === 37500)
            {
                mapZoomAndDancing.visible = false
                mapAnimationHeight.running = false
                mapAnimationWidth.running = false
                gottaStayIn.visible = true
                gottaStayInIn.visible = true
            }

            //Small IN text visible
            else if (totalTimeElapsed === 38800)
            {
                smallerIN.visible = true
            }

            //Smaller IN text invisible, bigger IN text visible
            else if (totalTimeElapsed === 39300)
            {
                smallerIN.visible = false
                biggerIN.visible = true
            }

            //End gotta stay in in, bigger IN text invisible, transition scenes
            else if (totalTimeElapsed === 40000)
            {
                gottaStayIn.visible = false
                raining.enabled = false
                gottaStayInIn.visible = false
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
                source: "../images/faceHouseClouds.png"
                anchors.fill: parent
            }
        }

        ParticleSystem
        {
            id: particles
        }
        ImageParticle
        {
            source: "../images/raindrop.png"
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
            source: "../images/washingtonMap.png"
            x: parent.width / 2 - (width / 2)
            y: parent.height / 2 - (height / 2)
            height: parent.height /2
            width: parent.width / 2

            PropertyAnimation
            {
                id: mapAnimationHeight
                target: washingtonMap
                properties: "height"
                from: Screen.height / 4
                to: Screen.height - (Screen.height * 0.4)
                duration: 1000
                running: true

                onRunningChanged:
                {
                    if (washingtonMap.height === Screen.height - (Screen.height * 0.4))
                    {
                        mapAnimationHeight.from = Screen.height - (Screen.height * 0.4)
                        mapAnimationHeight.to = Screen.height / 4
                        mapAnimationHeight.start()
                    }
                    else if (washingtonMap.height === Screen.height / 4)
                    {
                        mapAnimationHeight.from = Screen.height / 4
                        mapAnimationHeight.to = Screen.height - (Screen.height * 0.4)
                        mapAnimationHeight.start()
                    }
                }
            }

            PropertyAnimation
            {
                id: mapAnimationWidth
                target: washingtonMap
                properties: "width"
                from: Screen.width / 4
                to: Screen.width - (Screen.width * 0.4)
                duration: 1000
                running: true

                onRunningChanged:
                {
                    if (washingtonMap.width === Screen.width - (Screen.width * 0.4))
                    {
                        mapAnimationWidth.from = Screen.width - (Screen.width * 0.4)
                        mapAnimationWidth.to = Screen.width / 4
                        mapAnimationWidth.start()
                    }
                    else if (washingtonMap.width === Screen.width / 4)
                    {
                        mapAnimationWidth.from = Screen.width / 4
                        mapAnimationWidth.to = Screen.width - (Screen.width * 0.4)
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
            source: "../images/mattPerson/dancingGifMatt.gif"
            y: window.height / 8
            x: window.width / 4
        }

        AnimatedImage
        {
            id: dancingMolli
            width: parent.width/5
            height: parent.height/1.5
            visible: false
            source: "../images/molliPerson/dancingGifMolli.gif"
            y: window.height / 8
            x: window.width / 1.35
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

