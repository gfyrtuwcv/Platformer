import QtQuick 2.0
import Felgo 3.0
import "../entities"

SceneBase{//游戏场景
        id:scene
        width: 960
        height: 640
        Rectangle{
            anchors.fill: parent
            color: "white"
            Image{//背景图
                anchors.fill: parent
                id:backgroundimage
                property string bg0: "../../assets/backgroundImage/day_bg.png"
                property string bg1: "../../assets/backgroundImage/dusk_bg.png"
                property string bg2: "../../assets/backgroundImage/night_bg.png"
                source: bg0
            }
        }

        PhysicsWorld {//模拟物理世界,包含所有物理实体
            gravity: Qt.point(0, 15)//重力
            running: true//暂停游戏时设置为false
            updatesPerSecondForPhysics:30//物理世界每秒更新的频率
            velocityIterations: 5//速度的迭代
            positionIterations: 5//位置的迭代
            z:100//在实体上绘制debugDraw
            debugDrawVisible: true//设置为true查看物理系统的调试图

        }
        EntityManager{//实体管理器,管理从实体基础组件派生的所有实体
            id:entityManager
            entityContainer: scene
        }
        Player{
            id:player
            x:0
            y:0
            controller: controller
        }
        RoadBlock{
            //x:width
            //y:500
            anchors {
              bottom: scene.bottom
              left: scene.left
              right: scene.right
            }
        }
        Rectangle{
            enabled: true//启用和禁用触摸处理
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: 50
            width: 150
            color: "blue"
            opacity: 0.4//透明度
            MultiPointTouchArea{
                anchors.fill: parent
                onPressed: {
                  if(touchPoints[0].x < width/2)
                    controller.xAxis = -1
                  else
                    controller.xAxis = 1
                }
                onUpdated: {
                  if(touchPoints[0].x < width/2)
                    controller.xAxis = -1
                  else
                    controller.xAxis = 1
                }
                onReleased: controller.xAxis = 0
            }
        }

        Keys.forwardTo: controller
        TwoAxisController {//设置按键
          id: controller
          onInputActionPressed: {
            console.debug("key pressed actionName " + actionName + xAxis + "   " + yAxis)
            if(actionName == "up") {
              //player.jump()
            }
          }
        }
        Timer{
            id: updateTimer
            interval: 60//设置触发器之间的间隔，以毫秒为单位
            running: true//启动计时器
            repeat: true//在指定的时间间隔内重复触发
            onTriggered: {//超时触发
                var xAxis = controller.xAxis;
                if(xAxis === 0) {
                    if(Math.abs(player.collider.linearVelocity.x) > 10) player.collider.linearVelocity.x /= 1.5
                    else player.collider.linearVelocity.x = 0
                }
            }
        }

        /*BuildEntityButton {
        }
        ItemEditor{//项编辑器
             //标记为可编辑

        }*/
    }


