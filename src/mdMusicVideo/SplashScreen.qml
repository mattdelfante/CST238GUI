import QtQuick 2.0

Rectangle {
    id: splashScreen
    property int count: 0
    property string intialString: "Our project will be a music video to the song\nMy House by Flo Rida. As of right now, we both like\nthis song a lot, hopefully by the end of the\nterm we will not hate it too much."
    property string secondString: "The music video will be an animated video of both \nmyself (Matt) and Molli giving house tours of our\ndream houses."
    anchors.fill: parent

    DialogBox{
        id: bigBox
        color: "purple"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        x: parent.width/2 - width/2
        y: parent.height/4

        //TextRect properties
        textRect.width: width - width/20
        textRect.height: height/2
        textRect.anchors.topMargin: height/30
        textRect.words: intialString
        textRectBox.text: textRect.words
        textRectBox.color: "red"
        textRectBox.font.pointSize: textRect.height / 10
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
                bigBox.textRect.words = "One more time"
            }
            else if (count === 3)
            {
                splashScreen.parent.visible = false
            }
        }
    }
}
