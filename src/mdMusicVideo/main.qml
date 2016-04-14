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

    SplashScreen{}

    //***Also, idk if you get these warnings on your machine when you run it, but my application output says this
    // "QFont::setPointSizeF: Point size <= 0 (0.000000), must be greater than 0" 4 times. I noticed that commenting out
    // one of the pointSize specifications in a dialog box in splash screen made 1 of the 4 warnings go away, but idk
    // why they are happening in the first place since the value is greater than 0...Just pointing it out so you are
    // aware of it in case you have that warning too. Idk how to fix it tho so maybe you can figure it out?***

}

