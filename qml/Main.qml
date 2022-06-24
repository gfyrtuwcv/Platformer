import Felgo 3.0
import QtQuick 2.0

import "scenes"
GameWindow {//游戏窗口
    id: gameWindow
    screenWidth: 960
    screenHeight: 640
        GameScene{//游戏界面
            id:gameScene
        }
        LevelEditor{//游戏关卡编辑
            gameNetworkItem: gameNetwork//用户生成关卡需要的组件id
            toRemoveEntityTypes: ["prop","enemy","obstacles"]//应该删除的实体的数组
            toStoreEntityTypes: ["prop","enemy","obstacles"]//存储关卡可中的实体

            applicationJSONLevelsDirectory: "levels/"//存放关卡的目录
            onLevelPublished: {//发布具有关卡Id的级别时，将调用
            }

        }

        SelectLevelScene{//关卡界面
            id:selectLevelScene

            onBackButtonPressed: gameWindow.state="menu"
        }

        FelgoGameNetwork{//游戏排行榜、成就和挑战
            id:gameNetwork
        }

        MenuScene{//菜单界面
            id:menuScene

            onSelectLevelPressed: gameWindow.state="selectLevel"
            onCreditPressed: gameWindow.state="credit"
            //onExitPressed:
            onOptionPressed: gameWindow.state="option"

        }


        FontLoader {//加载字体
          id: marioFont
          source: "../assets/fonts/SuperMario256.ttf"
        }

        AudioManager {//音频管理
          id: audioManager
        }

        OptionScene{
            id:optionScene

            onMusicPressed: {
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

        }
        /*
          状态

        */
        state: "game"
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
//            State {
//                name: "credit"
//                PropertyChanges {
//                    target: C

//                }
//            }
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
            }
        ]
}

