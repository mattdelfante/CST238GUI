import QtQuick 2.0
import QtQuick 2.5

Image
{
    id: champagneBottleBg
    anchors.fill: parent
    source: "../images/champagneSceneBg.png"

    AnimatedImage
    {
        id: champagneBottle
        width: parent.width
        height: parent.height + parent.height/5
        x: parent.width/2 - width/2
        y: parent.height/2 - height/2
        source: "../images/champagneGif.gif"

        //Start gif after bottle has been moved and returns back to center
        playing:(xBehavior.enabled && champagneBottle.x === musicVideoRect.width/2 - champagneBottle.width/2
                 && champagneBottle.y === musicVideoRect.height/2 - champagneBottle.height/2) ? true : false

        onCurrentFrameChanged:
        {
            if (champagneBottle.currentFrame === 20)
                timerBottleOpened.start()
        }

        Timer
        {
            id: timerBottleOpened
            interval: 2200  //interval just right for scene to change on "Uh!" lyrics (for now)
            running: false

            onTriggered:
            {
                champagneBottle.visible = false
                //eventually set a signal to change scene
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
                myHouseSong.seek(1100)      //since song doesn't have sound until 1.1 seconds into the song
                myHouseSong.play()
                xBehavior.enabled = true
                yBehavior.enabled = true
                champagneBottle.x = musicVideoRect.width/2 - champagneBottle.width/2
                champagneBottle.y = musicVideoRect.height/2 - champagneBottle.height/2
                champagneBottleMouse.enabled = false    //prevents clicking & dragging more than once
                textDragAndDrogMe.visible = false
            }
        }
    }

    Text
    {
        id: textDragAndDrogMe
        anchors.bottom: champagneBottleBg.bottom
        anchors.horizontalCenter: champagneBottleBg.horizontalCenter
        text: "<Drag and Drop Bottle to Begin>"
        font.family: "Monotype Corsiva"
        font.pixelSize: champagneBottleBg.height/15
        color: "purple"
    }
}
