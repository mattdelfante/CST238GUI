import QtQuick 2.0
import QtQuick 2.5

Image
{
    signal endScene
    id: champagneBottleBg
    anchors.fill: parent
    source: "file:///" + AppDir + "/images/champagneSceneBg.png"

    property int count: 0

    Connections
    {
        id: connectionTimer
        target: MyTimer
        onTimerTimeout:
        {
            //Bottle is opened, Transition scenes
            if (totalTimeElapsed === 10400)
                endScene()            
        }
    }

    AnimatedImage
    {
        id: champagneBottle
        width: parent.width
        height: parent.height + parent.height/5
        x: parent.width/2 - width/2
        y: parent.height/2 - height/2
        source: "file:///" + AppDir + "/images/champagneGif.gif"

        //Start gif after bottle has been moved and returns back to center
        playing:(xBehavior.enabled && champagneBottle.x === musicVideoRect.width/2 - champagneBottle.width/2
                 && champagneBottle.y === musicVideoRect.height/2 - champagneBottle.height/2) ? true : false

        Behavior on x
        {
            id:xBehavior
            enabled: false

            XAnimator
            {
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

            YAnimator
            {
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
                if (champagneBottle.x != champagneBottleBg.width/2 - champagneBottle.width/2 &&
                    champagneBottle.y != champagneBottleBg.height/2 - champagneBottle.height/2)
                {
                    myHouseSong.seek(1500)      //since song doesn't have sound until 1.5 seconds into the song
                    myHouseSong.play()
                    MyTimer.startMyTimer()
                    xBehavior.enabled = true
                    yBehavior.enabled = true
                    champagneBottle.x = musicVideoRect.width/2 - champagneBottle.width/2
                    champagneBottle.y = musicVideoRect.height/2 - champagneBottle.height/2
                    champagneBottleMouse.enabled = false    //prevents clicking & dragging more than once
                    textDragAndDrogMe.visible = false
                }
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
