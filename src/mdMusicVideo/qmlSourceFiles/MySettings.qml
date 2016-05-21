import QtQuick 2.6
import QtQuick.Controls 1.5
import Qt.labs.settings 1.0

Rectangle {
    id: settingsWrapper
    property double volumeLevel: 0.5

    property bool exitAfterCredits: false
    property alias settingsVolumeSlide: volumeSlider.value

    signal clickMainMenu
    signal volumeChange

    anchors.fill: parent
    color: "orange"

    Settings
    {
        id: settingsDisplaySettings
        property alias volSlide: volumeSlider.value
        property alias exitAfterCreditsText: exitAfterCreditsButtonText.text
        property alias exitAfterCreditsBool: settingsWrapper.exitAfterCredits
    }

    Slider
    {
        id: volumeSlider
        value: 0.5
        x: settingsWrapper.width / 1.65
        y: volumeText.y + settingsWrapper.height * .04
        width: settingsWrapper.width * .125
        onValueChanged:
        {
            volumeLevel = value
            volumeChange()
        }
    }

    Text
    {
        id: titleText
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        text: "Settings"
        font.bold: true
        font.pixelSize: parent.height /6
        font.family: "Arial Black"
    }

    Text
    {
        id: volumeText
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: parent.width /-6.5
        anchors.top: titleText.bottom
        anchors.topMargin: parent.height / 10
        text: "Volume"
        font.bold: true
        font.pixelSize: parent.height /12
        font.family: "Monotype Corsiva"
    }

    Text
    {
        id: exitAfterCreditsText
        color: "white"
        anchors.left: volumeText.left
        anchors.horizontalCenterOffset: parent.width /-6.5
        anchors.top: volumeText.bottom
        anchors.topMargin: parent.height / 10
        text: "Exit After Credits"
        font.bold: true
        font.pixelSize: parent.height /12
        font.family: "Monotype Corsiva"
    }

    MyButton
    {
        id: exitAfterCreditsButton
        width: parent.width/10
        height: parent.height/12
        radius: width/2
        x: settingsWrapper.width / 1.6
        y: settingsWrapper.height / 1.79
        buttonColor: "light grey"

        Text
        {
            id: exitAfterCreditsButtonText
            anchors.horizontalCenter: exitAfterCreditsButton.horizontalCenter
            anchors.verticalCenter: exitAfterCreditsButton.verticalCenter
            text: "Off"
            font.bold: true
            font.pixelSize: exitAfterCreditsButton.height/3
            font.family: "Monotype Corsiva"
       }

        ma_buttonMouseArea.onEntered:
        {
            buttonColor = "#00fffb"
        }
        ma_buttonMouseArea.onExited:
        {
            buttonColor = "light grey"
        }
        ma_buttonMouseArea.onClicked:
        {
            if (exitAfterCreditsButtonText.text === "On")
            {
                exitAfterCreditsButtonText.text = "Off"
                exitAfterCredits = false
            }
            else
            {
                exitAfterCreditsButtonText.text = "On"
                exitAfterCredits = true
            }
        }
    }

    MyButton
    {
        id: mainMenuButton
        width: parent.width/5
        height: parent.height/6
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: .04 * parent.height
        radius: .0125 * parent.width
        buttonColor: "#7a34c4"

        Text
        {
            id: mainMenuButtonText
            anchors.horizontalCenter: mainMenuButton.horizontalCenter
            anchors.verticalCenter: mainMenuButton.verticalCenter
            text: "   Back to\nmain menu!"
            font.bold: true
            font.pixelSize: mainMenuButton.height/3
            font.family: "Monotype Corsiva"
        }

        ma_buttonMouseArea.onEntered:
        {
            buttonColor = "red"
        }
        ma_buttonMouseArea.onExited:
        {
            buttonColor = "#7a34c4"
        }
        ma_buttonMouseArea.onClicked:
        {
            clickMainMenu()
        }
    }
}

