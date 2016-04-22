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

    Rectangle
    {
        id: mainWindowContainer
        anchors.fill: parent

        SplashScreen
        {
            id: splashScreen

            onClickedPlay:
            {
                splashScreen.visible = false
                musicVideoScenes.visible = true
                musicVideoSettings.visible = false
            }

            onClickedSettings:
            {
                splashScreen.visible = false
                musicVideoScenes.visible = false
                musicVideoSettings.visible = true
            }

            onCloseProgram:
            {
                mainWindow.visible = false
            }
        }

        MusicVideo
        {
            id: musicVideoScenes
            visible: false

            onOpenedBottle: {
                while (a_myHouseSong.position <= 9000)
                {
                    if (a_myHouseSong.position === 9000)
                        ai_champagneBottle.visible = false
                }
            }
        }

        MySettings{
            id: musicVideoSettings
            visible: false
        }
    }
}

