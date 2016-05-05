import QtQuick 2.0
import QtQuick.Window 2.2
import QtMultimedia 5.5
import QtQuick.Particles 2.0

Rectangle
{
    property alias timerGottaStayIn: timerGottaStayIn
    signal endScene
    id: window
    anchors.fill: parent

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
            height: 100
            enabled: true
        }
    }

    Timer{
        id: timerGottaStayIn
        interval: 2500
        running: false

        onTriggered:{
            gottaStayIn.visible = false
            mapZoomAndDancing.visible = true
            timerMapZoom.start()
        }
    }

    Rectangle{
        id: mapZoomAndDancing
        anchors.fill: parent
        visible: false

        Image
        {
            id: washingtonMap
            source: "../images/washingtonMap.png"
            x: parent.width / 2 - (width / 2)
            y: parent.height / 2 - (height / 2)
            height: parent.height /2
            width: parent.width / 2

            Timer{
                id: timerMapZoom
                interval: 2500
                running: false

                onTriggered: {
                    dancingMatt.visible = true
                    dancingMolli.visible = true
                    timerDancingOnMap.start()
                }
            }

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
            visible: false
            source: "../images/mattPerson/dancingGifMatt.gif"
            y: Screen.height / 6
            x: Screen.width / 6
        }

        AnimatedImage
        {
            id: dancingMolli
            visible: false
            source: "../images/molliPerson/dancingGifMolli.gif"
            y: Screen.height / 6
            x: Screen.width / 2.25
        }
    }

    Timer{
        id: timerDancingOnMap
        interval: 2500
        running: false

        onTriggered:{
            mapZoomAndDancing.visible = false
            mapAnimationHeight.running = false
            mapAnimationWidth.running = false
            gottaStayIn.visible = true
            gottaStayInIn.visible = true
            timerSmallIn.start()
            timerStayInIn.start()
        }
    }

    Rectangle
    {
        id: gottaStayInIn
        visible: false
        anchors.fill: parent
        color: "transparent"

        Timer
        {
            id: timerSmallIn
            interval: 1250
            running: false

            onTriggered:
            {
                smallerIN.visible = true
                timerBiggerIn.start()
            }
        }

        Timer
        {
            id: timerBiggerIn
            interval: 500
            running: false

            onTriggered:
            {
                smallerIN.visible = false
                biggerIN.visible = true
            }
        }

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

    Timer{
        id: timerStayInIn
        interval: 2500
        running: false

        onTriggered:{
            gottaStayIn.visible = false
            raining.enabled = false
            gottaStayInIn.visible = false
            endScene()
        }
    }
}

