import QtQuick 2.0
import Felgo 3.0
import "entities"
Item {
    EntityManager{//实体管理器,管理从实体基础组件派生的所有实体
        id:entitymanager
        entityContainer: scene
    }
    Scene{//游戏场景
        id:scene
        width: 960
        height: 640


        BackgroundImage{//背景图
            id:backgroundimage
            property string bg0: "../assets/backgroundImage/day_bg.png"
            property string bg1: "../assets/backgroundImage/dusk_bg.png"
            property string bg2: "../assets/backgroundImage/night_bg.png"
            source: bg0
        }

        PhysicsWorld {//模拟物理世界,包含所有物理实体
            gravity.y: 9.81//使用地球重力
            updatesPerSecondForPhysics:30//物理世界每秒更新的频率
            running: true//暂停游戏时设置为false

        }

        Player{//玩家

        }

        BuildEntityButton {
        }
        ItemEditor{//项编辑器
             //标记为可编辑

        }
    }

}
