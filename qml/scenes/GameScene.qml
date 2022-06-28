import QtQuick 2.0
import Felgo 3.0
import "../entities"
import "../common"

SceneBase{//游戏场景
        id:scene
        width: 960
        height: 640



        property string activeLevelFileName

        property int time: 0

        signal backButtonPressed3
        function setLevel(fileName){
            activeLevelFileName = fileName
        }

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

        ButtonBase{
            text: "Back"
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            onClicked: backButtonPressed3()
        }

        PhysicsWorld {//模拟物理世界,包含所有物理实体
            id:physicsWorld
            property int gravitY: 15
            gravity: Qt.point(0, gravitY)//重力
            running: true//暂停游戏时设置为false
            updatesPerSecondForPhysics:30//物理世界每秒更新的频率
            velocityIterations: 5//速度的迭代
            positionIterations: 5//位置的迭代
            z:100//在实体上绘制debugDraw
            debugDrawVisible: true//设置为true查看物理系统的调试图

            onPreSolve: {
              //this is called before the Box2DWorld handles contact events
              var entityA = contact.fixtureA.getBody().target
              var entityB = contact.fixtureB.getBody().target
              if(entityA.entityType === "platform" && entityB.entityType === "player" &&
                      entityA.y  < entityB.y + entityB.height) {
                  console.debug("platform y:"+entityA.y+"   player Y:"+entityB.y)
                contact.enabled = false//关闭平台碰撞
              }else{
                  contact.enabled=true
              }
            }
            /*EditableComponent{//可编辑的属性
                target: physicsWorld
                editableType: "Balance"
                defaultGroup: "Physics"
                properties: {
                  "gravityY": {"min": 0, "max": 100, "label": "Gravity"}
                }
            }*/

        }
        Platform{
            x:160
            y:500
        }

        Platform{
            x:300
            y:400
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
              player.jump()
            }
          }
        }
        Timer{
            id: updateTimer
            interval: 30//设置触发器之间的间隔，以毫秒为单位
            running: true//启动计时器
            repeat: true//在指定的时间间隔内重复触发
            onTriggered: {//超时触发
                var xAxis = controller.xAxis;
                if(xAxis === 0) {
                    //player.foot.linearVelocity.x = 0
                    if(Math.abs(player.foot.linearVelocity.x) > 10) player.collider.linearVelocity.x /= 8
                    else player.foot.linearVelocity.x = 0
                }
            }
        }
    }


