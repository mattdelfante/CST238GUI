/*
  Name: Matthew Del Fante & Molli Drivdahl
  Lab: Lab2 Splash Screen
  Project Name: mdMusicVideo
*/
import QtQuick 2.6
import QtQuick.Window 2.2
import QtMultimedia 5.6

Window {
    id: mainWindow
    width: 800
    height: 500
    visible: true

    Rectangle
    {
        id: mainWindowContainer
        anchors.fill: parent

        SplashScreen
        {
            id: splashScreen
            onMakeInvisible: {
                myHouseSong.play()
                splashScreen.visible = false
                musicVideoScenes.visible = true
            }
        }

        MusicVideo
        {
            id: musicVideoScenes
            visible: false
        }

        Audio
        {
            id: myHouseSong
            source: "../sounds/myHouse.mp3"
            volume: 1.0
        }
    }






    //after a propery, you can call c code/java code
    //look for : or {} or :{}
//    Component.onCompleted:{
//        Matt.setDancing(true)

//        if(Matt.getDancing() === true)
//            console.log("He's dancing")
//        else
//            console.log("Not dancing")
//    }
}

