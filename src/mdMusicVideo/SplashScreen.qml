import QtQuick 2.0

Rectangle {
    id: splashScreen
    property int count: 0
    property string intialString: "Our project will be a music video to the song\nMy House by Flo Rida. As of right now, we both like\nthis song a lot, hopefully by the end of the\nterm we will not hate it too much."
    property string secondString: "The music video will be an animated video of both\nof us giving house tours of our dream houses."
    property string thirdString: "Drag this box around the screen,\nthen click one more time."
    anchors.fill: parent

    Image{
        anchors.fill: parent
        source: "splashScreenBg.png"
    }

    DialogBox{
        id: smallBox
        color: "blue"
        width: parent.width/4
        height: parent.height/4
        //x: bigBox.x + bigBox.width/4          //***If you uncomment these and comment the other x and y, the small box stays
        //y: bigBox.y + bigBox.height/4         //hidden behind the bix box when you move the big box. So small box not visible
                                                //until you click the big box button 3 times for it to disappear. Idk how we want
                                                //to set it up. Like how it is, or like this? Play with it and let me know.***
        x: parent.width/2.1
        y: parent.height/2
        Drag.active: dialogMouseArea.drag.active
        Drag.hotSpot.x: 32
        Drag.hotSpot.y: 32

        //TextRect properties
        textRect.width: width - width/20
        textRect.height: height/2
        textRect.anchors.topMargin: height/30
        textRect.color: "light grey"
        textRect.words: "Hello from Matt and Molli."
        textRectBox.text: textRect.words
        textRectBox.color: "black"
        textRectBox.font.pointSize: textRect.height/8
        textRectBox.font.bold: true

        //MyButton properties
        button.myColor: "light grey"
        buttonText.text: "Goodbye!"
        button.width: width/3
        button.height: height/5
        buttonText.font.pointSize: button.height/3

        buttonMouseActions.onClicked:
        {
            mainWindow.visible = false
        }
    }

    DialogBox{
        id: bigBox
        color: "purple"
        x: parent.width / 2.8
        y: parent.height / 2.25
        Drag.active: dialogMouseArea.drag.active
        Drag.hotSpot.x: 32
        Drag.hotSpot.y: 32

        //TextRect properties
        textRect.width: width - width/20
        textRect.height: height/2
        textRect.anchors.topMargin: height/30
        textRect.color: "light grey"
        textRect.words: intialString
        textRectBox.text: textRect.words
        textRectBox.color: "black"
        textRectBox.font.pointSize: textRect.height/12
        textRectBox.font.bold: true

        //MyButton properties
        button.myColor: "light grey"
        buttonText.text: "Click me!"
        buttonText.font.pointSize: button.height/4

        buttonMouseActions.onClicked:
        {
            count++
            if (count === 1)
            {
                bigBox.textRect.words = secondString
            }
            else if (count === 2)
            {
                bigBox.textRect.words = thirdString
            }
            else if (count === 3)
            {
                bigBox.visible = false
            }
        }
    }
}
