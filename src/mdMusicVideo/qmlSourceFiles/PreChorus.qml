import QtQuick 2.0
import QtQuick.Window 2.2
import QtMultimedia 5.5

Rectangle
{
    anchors.fill: parent
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

    Timer
    {
        id: timerForDancing
        interval: 3000
        //change
        //running: true

        onTriggered:
        {
            dancingMatt.visible = true
            dancingMolli.visible = true
        }
    }

    AnimatedImage
    {
        id: dancingMatt
        visible: false
        source: "../images/mattPerson/dancingGifMatt.gif"
        y: Screen.height / 8
        x: Screen.width / 8
    }

    AnimatedImage
    {
        id: dancingMolli
        visible: false
        source: "../images/molliPerson/dancingGifMolli.gif"
        y: Screen.height / 8
        x: Screen.width / 2
    }
}

