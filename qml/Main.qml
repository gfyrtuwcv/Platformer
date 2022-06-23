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
        }

        FelgoGameNetwork{//游戏排行榜、成就和挑战
            id:gameNetwork
        }

        MenuScene{//菜单界面
            id:menuScene

            onSelectLevelPressed: gameWindow.state="selectLevel"
            onCreditPressed: gameWindow.state="Credit"
        }


        FontLoader {//加载字体
          id: marioFont
          source: "../assets/fonts/SuperMario256.ttf"
        }

        AudioManager {//音频管理
          id: audioManager
        }

        /*
          状态

        */
        state: "menu"
        activeScene: gameScene
        states: [
            State {
                name: "menu"//菜单
                PropertyChanges {
                    target: menuScene

                }
            },
            State {
                name: "selectLevel"//关卡
                PropertyChanges {
                    target: levelScene

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
                    target: gameScene

                }
            }
        ]
}

