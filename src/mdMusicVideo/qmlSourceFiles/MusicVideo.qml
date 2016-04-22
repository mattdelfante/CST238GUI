import QtQuick 2.0
import QtQuick 2.5
import QtMultimedia 5.6

Rectangle {
    property alias a_myHouseSong: myHouseSong
    property alias ai_champagneBottle: champagneBottle
    id: musicVideoRect
    anchors.fill: parent

    signal openedBottle

    Audio
    {
        id: myHouseSong
        source: "../sounds/Voice_001.mp3"
        volume: 1.0

        onPlaying:{
            seekable: true
        }
    }

    Image
    {
        id: champagneBottleBg
        anchors.fill: parent
        source: "../images/champagneSceneBg.png"

        AnimatedImage
        {
            id: champagneBottle
            width: 600
            height: 450
            x: parent.width/2 - width/2
            y: parent.height/2 - height/2
            source: "../images/champagneGif.gif"
            playing:(xBehavior.enabled && champagneBottle.x === musicVideoRect.width/2 - champagneBottle.width/2
                     && champagneBottle.y === musicVideoRect.height/2 - champagneBottle.height/2) ? true : false

            onCurrentFrameChanged:
            {
                if (currentFrame === 4)
                {
                    paused = true
                    openedBottle()
                }
            }

            Behavior on x
            {
                id:xBehavior
                enabled: false

                XAnimator{
                    id: xBouncingAnimation
                    easing.type: Easing.InOutBounce
                    easing.amplitude: 2
                    duration: 7000
                }
            }

            Behavior on y
            {
                id: yBehavior
                enabled: false

                YAnimator{
                    id: yBouncingAnimation
                    easing.type: Easing.InOutBounce
                    duration: 7000
                }
            }

            MouseArea
            {
                id: champagneBottleMouse
                width: parent.width/4
                height: parent.height/2
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                drag.target: champagneBottle

                onClicked:
                {
                    drag.active = champagneBottle.drag.active

                }
                onReleased:
                {
                    myHouseSong.seek(1000)
                    myHouseSong.play()
                    xBehavior.enabled = true
                    yBehavior.enabled = true
                    champagneBottle.x = musicVideoRect.width/2 - champagneBottle.width/2
                    champagneBottle.y = musicVideoRect.height/2 - champagneBottle.height/2
                }
            }
        }
    }
}
