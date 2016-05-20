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
                settingsDisplaySettings.visible = false
            }

            onClickedSettings:
            {
                splashScreen.visible = false
                musicVideoScenes.visible = false
                settingsDisplaySettings.visible = true
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
            onEndOfCredits:
            {
                musicVideoScenes.visible = false
                splashScreen.visible = true
            }
        }

        MySettings
        {
            id: settingsDisplaySettings
            visible: false
            onClickMainMenu:
            {
                settingsDisplaySettings.visible = false
                splashScreen.visible = true
            }
            onClickMusicVideo:
            {
                settingsDisplaySettings.visible = false
                musicVideoScenes.visible = true
            }
            onVolumeChange:
            {
                if (isVolumeOn === false)
                    musicVideoScenes.myHouseSong.volume = 0.0
                else
                    musicVideoScenes.myHouseSong.volume = 1.0
            }
        }
    }
}

