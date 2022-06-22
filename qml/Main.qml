import Felgo 3.0
import QtQuick 2.0
import based 1.0
import "scenes"
GameWindow {//游戏窗口
    id: gameWindow
    activeScene: scene

    screenWidth: 960
    screenHeight: 640
        Gamescene{//游戏界面
            id:gamescene
        }

        LevelEditor{//游戏关卡编辑

            toRemoveEntityTypes: ["coin"]//应该删除的实体的数组
            toStoreEntityTypes: ["coin"]//存储关卡可中的实体

            gameNetworkItem: gameNetwork//用户生成关卡需要的组件id

            applicationJSONLevelsDirectory: "levels/"//存放关卡的目录
            onLevelPublished: {//发布具有关卡Id的级别时，将调用
            }

        }

        Levelscene{//关卡界面
            id:levescene
        }

        FelgoGameNetwork{//游戏排行榜、成就和挑战
            id:gameNetwork
        }

        Menuscene{//菜单界面
            id:menuscene
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
        states: [
            State {
                name: "menu"//菜单
                PropertyChanges {
                    target: menuscene

                }
            },
            State {
                name: "level"//关卡
                PropertyChanges {
                    target: levescene

                }
            },
            State {
                name: "game"//游戏
                PropertyChanges {
                    target: gamescene

                }
            }
        ]
}

