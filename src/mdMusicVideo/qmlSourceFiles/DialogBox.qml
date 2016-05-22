import QtQuick 2.0

Rectangle
{
    property alias tr_textRect:textRect
    property alias tx_textRectBox:textRect.tx_textBox
    property alias mb_button:myButton
    property alias tx_buttonText:buttonText
    property alias ma_buttonMouseActions:myButton.ma_buttonMouseArea
    property alias ma_dialogMouseArea:dialogMouseArea

    height: parent.height/2
    width: parent.width/2
    radius: height/25
    border.width: 2

    TextRect
    {
        id: textRect
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    MouseArea
    {
        id: dialogMouseArea
        anchors.fill: parent
        drag.target: parent
    }

    MyButton
    {
        id: myButton
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height/6
        anchors.horizontalCenter: parent.horizontalCenter

        Text
        {
            id: buttonText
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
