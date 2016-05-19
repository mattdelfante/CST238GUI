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
import QtQuick.Window 2.2
import QtQuick.Particles 2.0

Rectangle {
    signal endScene
    id: window
    width: parent.width
    height: parent.height

    Connections{
        id: connectionTimer
        target: MyTimer
        onTimerTimeout:{
            //Begin day to night
            if (totalTimeElapsed === 10300)
            {
                groundAnimation.running = true
                starsAnimation.running = true
                sunMoonStarsRotationAnimation.running = true
                skyGradientAnimation1.running = true
                skyGradientAnimation2.running = true
            }

            //End day to night, Begin come on in
            else if (totalTimeElapsed === 15500)
            {
                dayToNightScene.visible = false
                fancyFrontDoorOpen.visible = true
                molliWalkingToDoorX.running = true
                molliWalkingToDoorY.running = true
            }

            //End come on in, Begin where you been
            else if (totalTimeElapsed === 20500)
            {
                fancyFrontDoorOpen.visible = false
                livingRoomCouch.visible = true
                mattStandingCouchX.running = true
                mattStandingCouchY.running = true
                molliStandingCouchX.running = true
                molliStandingCouchY.running = true
            }

            //End where you been, Begin sitting still on couch
            else if (totalTimeElapsed === 25500)
            {
                standingByCouchScene.visible = false
                sittingOnCouchScene.visible = true
            }

            //End sitting still on couch, Begin cheers on couch
            else if (totalTimeElapsed === 27000)
            {
                mattSittingCheers.playing = true
                molliSittingCheers.playing = true
            }

            //End cheers on couch, Begin drinking on couch
            else if (totalTimeElapsed === 28500)
            {
                mattSittingCheers.source = "file:///" + AppDir + "/images/mattPerson/sittingDrinkingGifMatt.gif"
                molliSittingCheers.source = "file:///" + AppDir + "/images/molliPerson/sittingDrinkingGifMolli.gif"
                mattSittingCheers.playing = true
                molliSittingCheers.playing = true
            }

            //End drinking on couch, Transition scenes
            else if (totalTimeElapsed === 30000)
            {
                livingRoomCouch.visible = false
                endScene()
            }
        }
    }

    Rectangle{
        id: dayToNightScene
        anchors.fill: parent

        //Sky gradient
        Rectangle {
            anchors { left: parent.left; top: parent.top; right: parent.right; bottom: parent.verticalCenter }
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    SequentialAnimation on color {
                        id: skyGradientAnimation1
                        running: false
                        loops: Animation.Infinite
                        ColorAnimation { from: "#14148c"; to: "#0E1533"; duration: 5000 }
                        ColorAnimation { from: "#0E1533"; to: "#14148c"; duration: 5000 }
                    }
                }
                GradientStop {
                    position: 1.0
                    SequentialAnimation on color {
                        id: skyGradientAnimation2
                        running: false
                        loops: Animation.Infinite
                        ColorAnimation { from: "#14aaff"; to: "#437284"; duration: 5000 }
                        ColorAnimation { from: "#437284"; to: "#14aaff"; duration: 5000 }
                    }
                }
            }
        }

        //Sun, moon, stars
        Item {
            width: parent.width; height: 2 * parent.height
            NumberAnimation on rotation {
                id: sunMoonStarsRotationAnimation
                running: false
                from: 40; to: 400; duration: 10000; loops: Animation.Infinite
            }
            Image {
                width: .0625 * parent.width
                height: width
                source: "file:///" + AppDir + "/images/sun.png"; y: 10; anchors.horizontalCenter: parent.horizontalCenter
                rotation: -3 * parent.rotation
            }
            Image {
                width: .0625 * parent.width
                height: .8 * width
                source: "file:///" + AppDir + "/images/moon.png"; y: parent.height - 74; anchors.horizontalCenter: parent.horizontalCenter
                rotation: -parent.rotation
            }
            ParticleSystem {
                id: particlesystem
                x: 0; y: parent.height/2
                width: parent.width; height: parent.height/2
                ImageParticle {
                    width: 2
                    height: 2
                    source: "file:///" + AppDir + "/images/star.png"
                    groups: ["star"]
                    color: "#00333333"
                    SequentialAnimation on opacity {
                        id: starsAnimation
                        running: false
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

        //Ground gradient
        Rectangle {
            anchors { left: parent.left; top: parent.verticalCenter; right: parent.right; bottom: parent.bottom }
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    SequentialAnimation on color {
                        id: groundAnimation
                        running: false
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
            source: "file:///" + AppDir + "/images/mansion.png"
            width: height
            height: .3 * parent.height
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -.1 * parent.height
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
            anchors.rightMargin: .025 * parent.width
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
            anchors.leftMargin: .0125 * parent.width
            rotation: 25
        }
    }

    //Walking to front door
    Image {
        id: fancyFrontDoorOpen
        source: "file:///" + AppDir + "/images/openedFrontDoor.jpg"
        width: parent.width
        height: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        visible: false

        Image {
            id: molliWalkingToDoor
            source: "file:///" + AppDir + "/images/molliPerson/molliWalkingStance.png"
            y: parent.height/2
            width: .125 * parent.width
            height: .4 * window.height
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
            source: "file:///" + AppDir + "/images/mattPerson/mattWaitingStance.png"
            width: .125 * parent.width
            height: .4 * window.height
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: parent.height/20
            visible: true
        }
    }

    //In living room
    Image{
        id: livingRoomCouch
        source: "file:///" + AppDir + "/images/livingRoomCouch.jpg"
        width: parent.width
        height: parent.height
        visible: false

        //Walking
        Rectangle
        {
            id: standingByCouchScene
            anchors.fill: parent
            color: "transparent"

            Image{
                id: mattStanding
                source: "file:///" + AppDir + "/images/mattPerson/mattStanding.png"
                width: .1 * parent.width
                height: .464 * parent.height
                visible: true

                NumberAnimation{
                    id: mattStandingCouchX
                    target: mattStanding
                    properties: "x"
                    from: .0625 * parent.width
                    to: .65625 * parent.width
                    duration: 2500
                    running: false
                }

                NumberAnimation{
                    id: mattStandingCouchY
                    target: mattStanding
                    properties: "y"
                    from: .75 * parent.height
                    to: .3 * parent.height
                    duration: 2500
                    running: false

                    onStopped:{
                        mattSpeechBubble.visible = true
                    }
                }
            }

            Image{
                id: molliStanding
                source: "file:///" + AppDir + "/images/molliPerson/molliStanding.png"
                width: .1475 * parent.width
                height: .49 * parent.height
                visible: true

                NumberAnimation{
                    id: molliStandingCouchX
                    target: molliStanding
                    properties: "x"
                    from: 0
                    to: .53125 * parent.width
                    duration: 2500
                    running: false
                }

                NumberAnimation{
                    id: molliStandingCouchY
                    target: molliStanding
                    properties: "y"
                    from: .75 * parent.height
                    to: .3 * parent.height
                    duration: 2500
                    running: false

                    onStopped:{
                        molliSpeechBubble.visible = true
                    }
                }
            }

            Image{
                id: mattSpeechBubble
                source: "file:///" + AppDir + "/images/speechBubble.png"
                visible: false
                width: parent.width/6
                height: parent.height/6
                x: mattStanding.x + mattStanding.width
                y: mattStanding.y

                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Where you been?"
                    font.pixelSize: parent.height/6
                }
            }

            Image{
                id: molliSpeechBubble
                source: "file:///" + AppDir + "/images/speechBubble.png"
                mirror: true
                visible: false
                width: parent.width/6
                height: parent.height/6
                x: molliStanding.x - molliSpeechBubble.width
                y: molliStanding.y

                Text{
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Purvine."
                    font.pixelSize: parent.height/6
                }
            }
        }

        //Sitting
        Rectangle{
            id: sittingOnCouchScene
            anchors.fill: parent
            color: "transparent"
            visible: false

            AnimatedImage{
                id: mattSittingCheers
                source: "file:///" + AppDir + "/images/mattPerson/sittingCheersGifMatt.gif"
                width: .15875 * parent.width
                height: .492 * parent.height
                x: parent.width/6 * 4
                y: parent.height/2 - height/1.5
                playing: false
            }

            AnimatedImage{
                id: molliSittingCheers
                source: "file:///" + AppDir + "/images/molliPerson/sittingCheersGifMolli.gif"
                width: .17375 * parent.width
                height: .492 * parent.height
                x: parent.width/2
                y: parent.height/2 - height/1.5
                playing: false
            }
        }
    }
}
