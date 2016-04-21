import QtQuick 2.0

Rectangle {
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

        Behavior on x
        {
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
            anchors.fill: parent
            drag.target: champagneBottle

            onClicked:
            {
                drag.active = champagneBottle.drag.active
            }
            onReleased:
            {
                champagneBottle.x = musicVideoRect.width/2 - champagneBottle.width/2
                champagneBottle.y = musicVideoRect.height/2 - champagneBottle.height/2
            }
        }
    }
}
