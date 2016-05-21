import QtQuick 2.0

Rectangle
{
    property alias transitionText1: transitionText1
    property alias theEndText: theEndText
    signal endScene
    id: creditsWrapper
    anchors.fill: parent
    color: "black"
    visible: false

    Timer
    {
        id: transitionText1
        interval: 3500
        running: false
        onTriggered:
        {
            theEndText.visible = false
            producedByText.visible = true
            createdByText.visible = true
            choreographyByText.visible = true
            transitionText2.start()
        }
    }

    Text
    {
        id: theEndText
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: "The End"
        font.bold: true
        font.pixelSize: parent.height / 4
        font.family: "Monotype Corsiva"
    }

    Text
    {
        id: producedByText
        color: "white"
        visible: false
        anchors.horizontalCenter: parent.horizontalCenter
        y: creditsWrapper.height *0.3
        text: "Video Produced By: Matthew Del Fante and Molli Drivdahl"
        font.pixelSize: parent.height /15
        font.family: "Monotype Corsiva"
    }

    Text
    {
        id: createdByText
        color: "white"
        visible: false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: producedByText.bottom
        anchors.topMargin: creditsWrapper.height * .05
        text: "Video Created By: Matthew Del Fante and Molli Drivdahl"
        font.pixelSize: parent.height /15
        font.family: "Monotype Corsiva"
    }

    Text
    {
        id: choreographyByText
        color: "white"
        visible: false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: createdByText.bottom
        anchors.topMargin: creditsWrapper.height * .05
        text: "Choreography By: Matthew Del Fante and Molli Drivdahl"
        font.pixelSize: parent.height /15
        font.family: "Monotype Corsiva"
    }

    Timer
    {
        id: transitionText2
        interval: 5000
        running: false
        onTriggered:
        {
            producedByText.visible = false
            createdByText.visible = false
            choreographyByText.visible = false
            songsUsed.visible = true
            myHouse.visible = true
            handsToMyself.visible = true
            tenThousandHours.visible = true
            transitionText3.start()
        }
    }

    Text
    {
        id: songsUsed
        visible: false
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
        y: 0
        text: "Songs Used:"
        font.bold: true
        font.pixelSize: parent.height / 8
        font.family: "Monotype Corsiva"
    }

    Text
    {
        id: myHouse
        color: "white"
        visible: false
        anchors.horizontalCenter: parent.horizontalCenter
        y: creditsWrapper.height *0.3
        text: "My House By Flo Rida"
        font.pixelSize: parent.height /15
        font.family: "Monotype Corsiva"
    }

    Text
    {
        id: handsToMyself
        color: "white"
        visible: false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: producedByText.bottom
        anchors.topMargin: creditsWrapper.height * .05
        text: "Hands To Myself By Selena Gomez"
        font.pixelSize: parent.height /15
        font.family: "Monotype Corsiva"
    }

    Text
    {
        id: tenThousandHours
        color: "white"
        visible: false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: createdByText.bottom
        anchors.topMargin: creditsWrapper.height * .05
        text: "Ten Thousand Hours By Macklemore"
        font.pixelSize: parent.height /15
        font.family: "Monotype Corsiva"
    }

    Timer
    {
        id: transitionText3
        interval: 5000
        running: false
        onTriggered:
        {
            songsUsed.visible = false
            myHouse.visible = false
            handsToMyself.visible = false
            tenThousandHours.visible = false
            creditsWrapper.visible = false
            endScene()
        }
    }

}
