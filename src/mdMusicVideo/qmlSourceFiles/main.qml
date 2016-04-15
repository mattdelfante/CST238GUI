/*
  Name: Matthew Del Fante & Molli Drivdahl
  Lab: Lab2 Splash Screen
  Project Name: mdMusicVideo
*/
import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: mainWindow
    width: 800
    height: 500
    visible: true

    SplashScreen{
        id: splashScreen
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

