import Felgo 3.0
import QtQuick 2.0

GameWindow {//游戏窗口
    id: gameWindow
    activeScene: scene

    screenWidth: 960
    screenHeight: 640

        Gamesene{//游戏场景
            id:gamesene
        }
        LevelEditor{//游戏关卡编辑

        }
        FelgoGameNetwork{//游戏排行榜、成就和挑战

        }
        FontLoader {//加载字体
          id: marioFont
          source: "../assets/fonts/SuperMario256.ttf"
        }
        AudioManager {//音频管理
          id: audioManager
        }
}

