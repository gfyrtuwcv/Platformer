import Felgo 3.0
import QtQuick 2.0
import "scenes"
GameWindow {//游戏窗口
    id: gameWindow
    screenWidth: 960
    screenHeight: 640
    property var levelEditor:levelScene.levelEditor
    property var entityManager:levelScene.entityManager
    property var levelData
    GameScene{//游戏界面
        id:gameScene
        onBackButtonPressed3: {
            gameWindow.state = "selectLevel"
            audioManager.changeBackMusic()
        }
    }
    LevelScene{
        id:levelScene
        onBackPressed: {
            gameWindow.state="selectLevel"
        }
    }
    SelectLevelScene{//关卡界面
        id:selectLevelScene
        levelEditor:levelScene.levelEditor
        onBackButtonPressed: {
            gameWindow.state="menu"
            audioManager.changeBackMusic()
        }
        onProductPressed: {
            gameWindow.state = "level"
            entityManager.entityContainer=levelScene.level
        }
        onLevelplay: {
            gameWindow.state = "game"
            audioManager.changeBackMusic()
            gameScene.levelData=levelData
            gameScene.container.starLevel(levelData)
        }
    }

    /*FelgoGameNetwork{//游戏网络组件
            id:gameNetwork
        }*/

    MenuScene{//菜单界面
        id:menuScene

        onSelectLevelPressed: gameWindow.state="selectLevel"
        onCreditPressed: gameWindow.state="credit"
        onExitPressed: gameWindow.visible = false
        onOptionPressed: gameWindow.state="option"

    }

    FinishScene{
        id: finishScene
        player:gameScene.player
        onRestartPressed:{
            gameScene.container.starLevel(gameScene.levelData)
            gameWindow.state="game"
            audioManager.changeBackMusic()
        }
        onLevelsPressed: {
            gameWindow.state = "selectLevel"
            audioManager.changeBackMusic()
        }
        onMenuPressed: {
            gameWindow.state = "menu"
            audioManager.changeBackMusic()
        }
    }

    FontLoader {//加载字体
        id: marioFont
        source: "../assets/fonts/SuperMario256.ttf"
    }

    AudioManager{
        id:audioManager
    }
    OptionScene{
        id:optionScene
        property int num: 0
        onMusicPressed: {
            if(num==0){
                audioManager.stopMusic()
                num++
            }
            else{
                num--
                changeBackMusic()
            }

            if(Settings.musicEnabled)
                Settings.musicEnabled = false
            else
                Settings.musicEnabled = true
        }

        onSoundPressed: {
            if(Settings.soundEnabled){
                Settings.soundEnabled = false
            }
            else{
                Settings.soundEnabled = true

                //audioManager.
            }
        }

        onBackButtonPressed2: gameWindow.state = "menu"

    }
    /*
          状态

        */
    state: "menu"
    //activeScene: gameScene
    states: [
        State {
            name: "menu"//菜单
            PropertyChanges {
                target: menuScene; opacity: 1}
            PropertyChanges {
                target: gameWindow; activeScene:menuScene

            }
        },
        State {
            name: "selectLevel"//关卡
            PropertyChanges {
                target: selectLevelScene; opacity:1
            }
            PropertyChanges {
                target: gameWindow; activeScene: selectLevelScene
            }
        },

        State {
            name: "level"//关卡
            PropertyChanges {
                target: levelScene; opacity:1
            }
            PropertyChanges {
                target: gameWindow; activeScene: levelScene
            }
        },
        State {
            name: "game"//游戏
            PropertyChanges {
                target: gameScene; opacity:1
            }
            PropertyChanges {
                target: gameWindow; activeScene: gameScene
            }
        },
        State {
            name: "option"
            PropertyChanges {
                target: optionScene; opacity: 1
            }
            PropertyChanges {
                target: gameWindow; activeScene:optionScene
            }
        },
        State {
            name: "finish"
            PropertyChanges {
                target: finishScene; opacity: 1
            }
            PropertyChanges {
                target: gameWindow; opacity: 1
            }
        }
    ]

}

