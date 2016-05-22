import QtQuick 2.0

Rectangle
{
    signal endScene
    id: creditsWrapper
    anchors.fill: parent
    color: "black"
    visible: false

    Connections
    {
        id: connectionTimer
        target: MyTimer
        onTimerTimeout:
        {
            if (totalTimeElapsed === 191200)
            {
                theEndText.visible = true
            }

            else if (totalTimeElapsed === 194400)
            {
                theEndText.visible = false
                producedByText.visible = true
                createdByText.visible = true
                choreographyByText.visible = true
            }

            else if (totalTimeElapsed === 199400)
            {
                producedByText.visible = false
                createdByText.visible = false
                choreographyByText.visible = false
                songsUsed.visible = true
                myHouse.visible = true
                handsToMyself.visible = true
                tenThousandHours.visible = true
            }

            else if (totalTimeElapsed === 204400)
            {
                songsUsed.visible = false
                myHouse.visible = false
                handsToMyself.visible = false
                tenThousandHours.visible = false
                specialThanks.visible = true
            }

            else if (totalTimeElapsed === 208400)
            {
                specialThanks.visible = false
                creditsWrapper.visible = false
                endScene()
            }
        }
    }

    Text
    {
        id: theEndText
        color: "white"
        visible: false
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
        text: "Ten Thousand Hours By Macklemore and Ryan Lewis"
        font.pixelSize: parent.height /15
        font.family: "Monotype Corsiva"
    }

    Text
    {
        id: specialThanks
        color: "white"
        visible: false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: "Special thanks to Chris Dean, Jacob Neal\nand Stu Taylor for all the help this term."
        font.pixelSize: parent.height /15
        font.family: "Monotype Corsiva"
    }
}
