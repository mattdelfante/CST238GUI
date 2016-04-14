/*
  Name: Matthew Del Fante & Molli Drivdahl
  Lab: Lab2 Splash Screen
  Project Name: mdMusicVideo
*/
import QtQuick 2.0

Rectangle {
    id: splashScreen
    property int count: 0
    property string intialString: "Our project will be a music video to the song\nMy House by Flo Rida. As of right now, we both like\nthis song a lot, hopefully by the end of the\nterm we will not hate it too much."
    property string secondString: "The music video will be an animated video of both\nof us giving house tours of our dream houses.\nHopefully the scope of this project is feasible\nfor the time frame given."
    property string thirdString: "As for the splash screen, we will implement one, but\nit will be different and simpiler than this \none. It will basically allow the user to start \nthe music video or exit the music video."
    property string fourthString: "The future splash screen will have a cooler \nbackground though. Hopefully it will have some \ncool animations going on and have some music\nto go along with the animations as well once we\nlearn how to do those things."
    property string fifthString: "Go ahead and drag the dialog box if you haven't \nand click the button one more time to make \nthe dialog box to disappear."
    anchors.fill: parent

    Image{
        anchors.fill: parent
        source: "../../img/projectImages/splashScreenBg.png"
    }

    DialogBox{
        id: smallBox
        color: "blue"
        width: parent.width/4
        height: parent.height/4
        x: parent.width/2.1
        y: parent.height/2
        Drag.active: ma_dialogMouseArea.drag.active

        //smallerBox TextRect properties
        tr_textRect.width: width - width/20
        tr_textRect.height: height/2
        tr_textRect.anchors.topMargin: height/30
        tr_textRect.color: "light grey"
        tr_textRect.words: "Hello from Matt and Molli."
        tx_textRectBox.text: tr_textRect.words
        tx_textRectBox.color: "black"
        tx_textRectBox.font.pointSize: tr_textRect.height/8
        tx_textRectBox.font.bold: true

        //smallerBox MyButton properties
        mb_button.buttonColor: "light grey"
        tx_buttonText.text: "Goodbye!"
        mb_button.width: width/3
        mb_button.height: height/5
        tx_buttonText.font.pointSize: mb_button.height/3

        ma_buttonMouseActions.onClicked:
        {
            mainWindow.visible = false
        }
    }

    DialogBox{
        id: bigBox
        color: "purple"
        x: parent.width / 2.8
        y: parent.height / 2.25
        Drag.active: ma_dialogMouseArea.drag.active

        //bigBox TextRect properties
        tr_textRect.width: width - width/20
        tr_textRect.height: height/2
        tr_textRect.anchors.topMargin: height/30
        tr_textRect.color: "light grey"
        tr_textRect.words: intialString
        tx_textRectBox.text: tr_textRect.words
        tx_textRectBox.color: "black"
        tx_textRectBox.font.pointSize: tr_textRect.height/12
        tx_textRectBox.font.bold: true

        //bigBox MyButton properties
        mb_button.buttonColor: "light grey"
        tx_buttonText.text: "Click me!"
        tx_buttonText.font.pointSize: mb_button.height/4

        ma_buttonMouseActions.onClicked:
        {
            count++
            if (count === 1)
            {
                bigBox.tr_textRect.words = secondString
            }
            else if (count === 2)
            {
                bigBox.tr_textRect.words = thirdString
            }
            else if (count === 3)
            {
                bigBox.tr_textRect.words = fourthString
            }
            else if (count === 4)
            {
                bigBox.tr_textRect.words = fifthString
            }
            else if (count === 5)
            {
                bigBox.visible = false
            }
        }
    }
}
