/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0
import QtQuick.Particles 2.0

Rectangle {
    property alias timerNightBegins: timerNightBegins
    id: window
    width: parent.width
    height: parent.height

    Rectangle{
        id: dayToNightScene
        anchors.fill: parent

        // Let's draw the sky...
        Rectangle {
            anchors { left: parent.left; top: parent.top; right: parent.right; bottom: parent.verticalCenter }
            //! [0]
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    SequentialAnimation on color {
                        loops: Animation.Infinite
                        ColorAnimation { from: "#14148c"; to: "#0E1533"; duration: 5000 }
                        ColorAnimation { from: "#0E1533"; to: "#14148c"; duration: 5000 }
                    }
                }
                GradientStop {
                    position: 1.0
                    SequentialAnimation on color {
                        loops: Animation.Infinite
                        ColorAnimation { from: "#14aaff"; to: "#437284"; duration: 5000 }
                        ColorAnimation { from: "#437284"; to: "#14aaff"; duration: 5000 }
                    }
                }
            }
            //! [0]
        }

        // the sun, moon, and stars
        Item {
            width: parent.width; height: 2 * parent.height
            NumberAnimation on rotation { from: 0; to: 360; duration: 10000; loops: Animation.Infinite }
            Image {
                width: 50
                height: 50
                source: "../images/sun.png"; y: 10; anchors.horizontalCenter: parent.horizontalCenter
                rotation: -3 * parent.rotation
            }
            Image {
                width: 50
                height: 40
                source: "../images/moon.png"; y: parent.height - 74; anchors.horizontalCenter: parent.horizontalCenter
                rotation: -parent.rotation
            }
            ParticleSystem {
                id: particlesystem
                x: 0; y: parent.height/2
                width: parent.width; height: parent.height/2
                ImageParticle {
                    width: 2
                    height: 2
                    source: "../images/star.png"
                    groups: ["star"]
                    color: "#00333333"
                    SequentialAnimation on opacity {
                        loops: Animation.Infinite
                        NumberAnimation { from: 0; to: 1; duration: 5000 }
                        NumberAnimation { from: 1; to: 0; duration: 5000 }
                    }
                }
                Emitter {
                    group: "star"
                    anchors.fill: parent
                    emitRate: parent.width / 50
                    lifeSpan: 5000
                }
            }
        }

        // ...and the ground.
        Rectangle {
            anchors { left: parent.left; top: parent.verticalCenter; right: parent.right; bottom: parent.bottom }
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    SequentialAnimation on color {
                        loops: Animation.Infinite
                        ColorAnimation { from: "#80c342"; to: "#001600"; duration: 5000 }
                        ColorAnimation { from: "#001600"; to: "#80c342"; duration: 5000 }
                    }
                }
                GradientStop { position: 1.0; color: "#006325" }
            }
        }

        Image
        {
            id: mansion
            source: "../images/mansion.png"
            width: 150
            height: 150
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -50
        }

        Text
        {
            id: leftKnock
            color: "red"
            text: "Knock"
            font.pixelSize: parent.height/12
            font.family: "Poor Richard"
            anchors.verticalCenter: mansion.verticalCenter
            anchors.right: mansion.left
            anchors.rightMargin: 20
            rotation: -25
        }

        Text
        {
            id: rightKnock
            color: "red"
            text: "Knock"
            font.pixelSize: parent.height/12
            font.family: "Poor Richard"
            anchors.verticalCenter: mansion.verticalCenter
            anchors.left: mansion.right
            anchors.leftMargin: 10
            rotation: 25
        }
    }

    Timer{
        id: timerNightBegins
        interval: 5000
        running: false

        onTriggered:{
            dayToNightScene.visible = false
            fancyFrontDoorOpen.visible = true
            molliWalkingToDoorX.running = true
            molliWalkingToDoorY.running = true
            timerComeOnIn.start()
        }
    }

    Image {
        id: fancyFrontDoorOpen
        source: "../images/openedFrontDoor.jpg"
        width: parent.width
        height: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        visible: false

        Image {
            id: molliWalkingToDoor
            source: "../images/molliPerson/molliWalkingStance.png"
            y: parent.height/2
            width: 100
            visible: true

            NumberAnimation{
                id: molliWalkingToDoorX
                target: molliWalkingToDoor
                properties: "x"
                from: fancyFrontDoorOpen.width/8
                to: fancyFrontDoorOpen.width/2.7
                duration: 4500
                running: false
            }

            NumberAnimation{
                id: molliWalkingToDoorY
                target: molliWalkingToDoor
                properties: "y"
                from: fancyFrontDoorOpen.height/1.6
                to: fancyFrontDoorOpen.height/2.25
                duration: 4500
                running: false
            }
        }

        Image {
            id: mattWaitingAtDoor
            source: "../images/mattPerson/mattWaitingStance.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: parent.height/20
            visible: true
        }
    }

    Timer{
        id: timerComeOnIn
        interval: 5000
        running: false

        onTriggered:{
            fancyFrontDoorOpen.visible = false
            livingRoomCouch.visible = true
            mattStandingCouchX.running = true
            mattStandingCouchY.running = true
            molliStandingCouchX.running = true
            molliStandingCouchY.running = true
        }
    }

    Image{
        id: livingRoomCouch
        source: "../images/livingRoomCouch.jpg"
        width: parent.width
        height: parent.height
        visible: false

        Image{
            id: mattStanding
            source: "../images/mattPerson/mattStanding.png"
            visible: true

            NumberAnimation{
                id: mattStandingCouchX
                target: mattStanding
                properties: "x"
                from: 600
                to: 450
                duration: 2500
                running: false
            }

            NumberAnimation{
                id: mattStandingCouchY
                target: mattStanding
                properties: "y"
                from: 500
                to: 150
                duration: 2500
                running: false
            }
        }

        Image{
            id: molliStanding
            source: "../images/molliPerson/molliStanding.png"
            visible: true

            NumberAnimation{
                id: molliStandingCouchX
                target: molliStanding
                properties: "x"
                from: 200
                to: 350
                duration: 2500
                running: false
            }

            NumberAnimation{
                id: molliStandingCouchY
                target: molliStanding
                properties: "y"
                from: 500
                to: 150
                duration: 2500
                running: false
            }
        }
    }
}