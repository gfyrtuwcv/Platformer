import QtQuick 2.0
import Felgo 3.0
import "../entities"

SceneBase{//游戏场景
        id:scene
        width: 960
        height: 640
        EntityManager{//实体管理器,管理从实体基础组件派生的所有实体
            id:entitymanager
            entityContainer: scene
        }

        BackgroundImage{//背景图
            id:backgroundimage
            property string bg0: "../assets/backgroundImage/day_bg.png"
            property string bg1: "../assets/backgroundImage/dusk_bg.png"
            property string bg2: "../assets/backgroundImage/night_bg.png"
            source: bg0
        }

        PhysicsWorld {//模拟物理世界,包含所有物理实体
            gravity.y: 9.81//使用地球重力
            running: true//暂停游戏时设置为false
            updatesPerSecondForPhysics:30//物理世界每秒更新的频率
            velocityIterations: 5//速度的迭代
            positionIterations: 5//位置的迭代
            z:10//在实体上绘制debugDraw
            debugDrawVisible: false//设置为true查看物理系统的调试图

        }

        Player{//玩家

        }

        BuildEntityButton {
        }
        ItemEditor{//项编辑器
             //标记为可编辑

        }

}


