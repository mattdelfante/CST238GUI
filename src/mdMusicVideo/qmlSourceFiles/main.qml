import QtQuick 2.6
import QtQuick.Window 2.2
import QtMultimedia 5.6
import Qt.labs.settings 1.0

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
            handsToMyselfSong.play();
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

    Settings
    {
        id: mainMenuSettings
        property alias volLevelHandsToMyself: handsToMyselfSong.volume
    }

    Rectangle
    {
        id: mainWindowContainer
        anchors.fill: parent

        Audio
        {
            id: handsToMyselfSong
            source: "file:///" + AppDir + "/sounds/handsToMyselfSelenaGomez.mp3"
            autoPlay: true
            volume: 0.5
            loops: Audio.Infinite
        }

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
                handsToMyselfSong.stop()
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
                MyTimer.startMyTimer(191100)
                handsToMyselfSong.stop()
            }

            onCloseProgram:
            {
                destroyMusicVideoScenes()
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
                {
                    musicVideoScenes.myHouseSong.volume = volumeLevel
                    handsToMyselfSong.volume = volumeLevel
                    musicVideoScenes.tenThousandHoursSong.volume = volumeLevel
                }
            }
        }
    }

    Component.onCompleted:
    {
        if (musicVideoScenes === null)
            createMusicVideoComponent()
    }
}

