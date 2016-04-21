import QtQuick 2.0

Rectangle {
    property alias champagneBottle: champagneBottle

    id: musicVideoRect
    anchors.fill: parent

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
                champagneBottle.visible = false
            }
        }

        Behavior on x
        {
            id:xBehavior
            enabled: false

            SpringAnimation
            {
                id: spg_animation_x
                spring: 4.0
                damping: .5
                epsilon: 0.5
                mass: 10

            }
        }

        Behavior on y
        {
            id: yBehavior
            enabled: false

            SpringAnimation
            {
                id: spg_animation_y
                spring: 4.0
                damping: .5
                epsilon: 0.5
                mass: 10

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
                xBehavior.enabled = true
                yBehavior.enabled = true
                champagneBottle.x = musicVideoRect.width/2 - champagneBottle.width/2
                champagneBottle.y = musicVideoRect.height/2 - champagneBottle.height/2
            }
        }

    }
}
