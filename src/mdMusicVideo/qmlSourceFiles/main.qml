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
    property var component: null
    property var musicVideoScenes: null

    function createMusicVideoComponent()
    {
        //dynamicaly create the MusicVideo component and set up it's signals
        component = Qt.createComponent("MusicVideo.qml");
        musicVideoScenes = component.createObject(mainWindowContainer, {"visible": false});
        musicVideoScenes.endOfCredits.connect(musicVideoSceneFinished);
        musicVideoScenes.volumeChanged.connect(musicVideoVolumeChanged);
    }

    function musicVideoSceneFinished()
    {
        MyTimer.stopMyTimer()
        musicVideoScenes.visible = false;
        destroyMusicVideoScenes();


        if (settingsDisplaySettings.exitAfterCredits === false)
        {
            splashScreen.visible = true;
        }
        else
        {
            mainWindow.close()
        }
    }

    function musicVideoVolumeChanged()
    {
        settingsDisplaySettings.volumeLevel = myHouseSong.volume;
    }

    function destroyMusicVideoScenes()
    {
        //destroy the dynamically created component
        musicVideoScenes.destroy();
        musicVideoScenes.endOfCredits.disconnect(musicVideoSceneFinished);
        musicVideoScenes.volumeChanged.disconnect(musicVideoVolumeChanged);
        musicVideoScenes = null;
    }

    Rectangle
    {
        id: mainWindowContainer
        anchors.fill: parent

        SplashScreen
        {
            id: splashScreen

            onVisibleChanged:
            {
                if (visible === true && musicVideoScenes === null)
                    createMusicVideoComponent()
            }

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

            onClickedCredits:
            {
                splashScreen.visible = false
                musicVideoScenes.visible = true
                musicVideoScenes.creditsScene.visible = true
            }

            onCloseProgram:
            {
                //call destroy function
                mainWindow.close()
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
            onVolumeChange:
            {
                if (musicVideoScenes != null)
                    musicVideoScenes.myHouseSong.volume = volumeLevel
            }
        }
    }

    Component.onCompleted:
    {
        if (musicVideoScenes === null)
            createMusicVideoComponent()
    }
}

