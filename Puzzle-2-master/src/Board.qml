// x = first  player
// o = second player

import QtQuick 2.0

Rectangle
{
    property bool game_over: false
    property bool first_player_turn: true
    property variant has_clicked: [false, false, false, false, false, false, false, false, false]

    function check_game_over()
    {
    }

    id: big_wrapper
    anchors.fill: parent
    border.color: "white"

    Text
    {
        id: txt_game_over
        visible: false
        font.family: "Arial"
        font.pointSize: 72
        color: "Red"
        text: "Game Over"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Grid
    {
        id: grd_board
        height: parent.height * .75
        width: parent.width * .75
        anchors.horizontalCenter: big_wrapper.horizontalCenter
        anchors.verticalCenter: big_wrapper.verticalCenter
        columns: 3
        rows: 3

        Rectangle
        {
            border.color: "white";
            height: parent.height/3;
            width: parent.width/3;
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    if (has_clicked[0] === false)
                    {
                        has_clicked[0] = true
                        if(first_player_turn === true && has_clicked[0] === true)
                        {
                            img_x1.visible = true
                            first_player_turn = !first_player_turn
                        }
                        else
                        {
                            img_o1.visible = true
                            first_player_turn = !first_player_turn
                        }
                    }
                }
            }
            Image
            {
                id: img_x1;
                visible: false;
                anchors.horizontalCenter: parent.horizontalCenter;
                height: 100;
                width: 100;
                source: "../img/letter_x.png";
            }
            Image
            {
                id: img_o1;
                visible: false;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
                height: 75;
                width: 75;
                source: "../img/letter_o.png";
            }
        }

        Rectangle
        {
            border.color: "red";
            height: parent.height/3;
            width: parent.width/3;
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    if (has_clicked[1] === false)
                    {
                        has_clicked[1] = true
                        if(first_player_turn === true && has_clicked[1] === true)
                        {
                            img_x2.visible = true
                            first_player_turn = !first_player_turn
                        }
                        else
                        {
                            img_o2.visible = true
                            first_player_turn = !first_player_turn
                        }
                    }
                }
            }
            Image
            {
                id: img_x2;
                visible: false;
                anchors.horizontalCenter: parent.horizontalCenter;
                height: 100;
                width: 100;
                source: "../img/letter_x.png";
            }
            Image
            {
                id: img_o2;
                visible: false;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.verticalCenter: parent.verticalCenter;
                height: 75;
                width: 75;
                source: "../img/letter_o.png";
            }
        }
        Rectangle{border.color: "white"; height: parent.height/3; width: parent.width/3;MouseArea{
                anchors.fill: parent
                onClicked:{
                    if (has_clicked[2] === false)
                    {
                        has_clicked[2] = true
                        if(first_player_turn === true && has_clicked[2] === true)
                        {
                            img_x3.visible = true
                            first_player_turn = !first_player_turn
                        }
                        else
                        {
                            img_o3.visible = true
                            first_player_turn = !first_player_turn
                        }
                    }
                }
            } Image{ id: img_x3; visible: false; anchors.horizontalCenter: parent.horizontalCenter; height: 100; width: 100;source: "../img/letter_x.png";} Image{ id: img_o3; visible:false; anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter; height: 75; width: 75;source: "../img/letter_o.png";}}
        Rectangle{border.color: "magenta"; height: parent.height/3; width: parent.width/3;
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    if (has_clicked[3] === false)
                    {
                        has_clicked[3] = true
                        if(first_player_turn === true && has_clicked[3] === true)
                        {
                            img_x4.visible = true
                            first_player_turn = !first_player_turn
                        }
                        else
                        {
                            img_o4.visible = true
                            first_player_turn = !first_player_turn
                        }
                    }
                }
            }

            Image{ id: img_x4; visible: false; anchors.horizontalCenter: parent.horizontalCenter; height: 100; width: 100;source: "../img/letter_x.png";} Image{ id: img_o4; visible: false; anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter; height: 75; width: 75;source: "../img/letter_o.png";}}
        Rectangle{border.color: "gold"; height: parent.height/3; width: parent.width/3;
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    if (has_clicked[4] === false)
                    {
                        has_clicked[4] = true
                        if(first_player_turn === true && has_clicked[4] === true)
                        {
                            img_x5.visible = true
                            first_player_turn = !first_player_turn
                        }
                        else
                        {
                            img_o5.visible = true
                            first_player_turn = !first_player_turn
                        }
                    }
                }
            }
            Image{ id: img_x5; visible: false; anchors.horizontalCenter: parent.horizontalCenter; height: 100; width: 100;source: "../img/letter_x.png";} Image{ id: img_o5; visible: false; anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter; height: 75; width: 75;source: "../img/letter_o.png";}}
        Rectangle{border.color: "green"; height: parent.height/3; width: parent.width/3;
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    if (has_clicked[5] === false)
                    {
                        has_clicked[5] = true
                        if(first_player_turn === true && has_clicked[5] === true)
                        {
                            img_x6.visible = true
                            first_player_turn = !first_player_turn
                        }
                        else
                        {
                            img_o6.visible = true
                            first_player_turn = !first_player_turn
                        }
                    }
                }
            }
            Image{ id: img_x6; visible: false; anchors.horizontalCenter: parent.horizontalCenter; height: 100; width: 100;source: "../img/letter_x.png";} Image{ id: img_o6; visible: false; anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter; height: 75; width: 75;source: "../img/letter_o.png";}}
        Rectangle{border.color: "white"; height: parent.height/3; width: parent.width/3;
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    if (has_clicked[6] === false)
                    {
                        has_clicked[6] = true
                        if(first_player_turn === true && has_clicked[6] === true)
                        {
                            img_x7.visible = true
                            first_player_turn = !first_player_turn
                        }
                        else
                        {
                            img_o7.visible = true
                            first_player_turn = !first_player_turn
                        }
                    }
                }
            }
            Image{ id: img_x7; visible: false; anchors.horizontalCenter: parent.horizontalCenter; height: 100; width: 100;source: "../img/letter_x.png";} Image{ id: img_o7; visible: false; anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter; height: 75; width: 75;source: "../img/letter_o.png";}}
        Rectangle{border.color: "brown"; height: parent.height/3; width: parent.width/3;
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    if (has_clicked[7] === false)
                    {
                        has_clicked[7] = true
                        if(first_player_turn === true && has_clicked[7] === true)
                        {
                            img_x8.visible = true
                            first_player_turn = !first_player_turn
                        }
                        else
                        {
                            img_o8.visible = true
                            first_player_turn = !first_player_turn
                        }
                    }
                }
            }
            Image{ id: img_x8; visible: false; anchors.horizontalCenter: parent.horizontalCenter; height: 100; width: 100;source: "../img/letter_x.png";} Image{ id: img_o8; visible: false; anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter; height: 75; width: 75;source: "../img/letter_o.png";}}
        Rectangle{border.color: "white"; height: parent.height/3; width: parent.width/3;
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    if (has_clicked[8] === false)
                    {
                        has_clicked[8] = true
                        if(first_player_turn === true && has_clicked[8] === true)
                        {
                            img_x9.visible = true
                            first_player_turn = !first_player_turn
                        }
                        else
                        {
                            img_o9.visible = true
                            first_player_turn = !first_player_turn
                        }
                    }
                }
            }
            Image{ id: img_x9; visible: false; anchors.horizontalCenter: parent.horizontalCenter; height: 100; width: 100;source: "../img/letter_x.png";} Image{ id: img_o9; visible: false; anchors.horizontalCenter: parent.horizontalCenter; anchors.verticalCenter: parent.verticalCenter; height: 75; width: 75;source: "../img/letter_o.png";}}
    }

    Rectangle
    {
        id: rect_left
        anchors.right: grd_board.left
        anchors.rightMargin: -10
        height: grd_board.height
        width: grd_board.width

        border.color: "white"
        border.width: 20
    }

    Rectangle
    {
        id: rect_right
        anchors.left: grd_board.right
        anchors.leftMargin: -10
        height: grd_board.height
        width: grd_board.width

        border.color: "white"
        border.width: 20
    }

    Rectangle
    {
        id: rect_top
        anchors.bottom: grd_board.top
        anchors.bottomMargin: -10
        height: grd_board.height
        width: grd_board.width

        border.color: "white"
        border.width: 20
    }

    Rectangle
    {
        id: rect_bottom
        anchors.top: grd_board.bottom
        anchors.topMargin: -10
        height: grd_board.height
        width: grd_board.width

        border.color: "white"
        border.width: 20
    }
}
