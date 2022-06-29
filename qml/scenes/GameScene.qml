import QtQuick 2.0
import Felgo 3.0
import "../entities"
import "../common"

SceneBase{//游戏场景
    id:scene
    width: 960
    height: 640

    property string activeLevelFileName
    property var levelEditor
    property var levelData
    property int time: 0


    signal backButtonPressed3
    function starLevel(){//levelData
        //activeLevelFileName = fileName
        //levelEditor.removeCurrentLevel ()
        //levelEditor.loadAllLevelsFromStorageLocation(levelData)
        console.debug("start")
        levelEditor.loadAllLevelsFromStorageLocation()
        player.resetPosition()

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
        EntityBase{
            anchors.top: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height: 1
            BoxCollider{
                id:wall
                anchors.fill: parent
                bodyType: Body.Static//静态,不移动
                fixture.onBeginContact:{
                    player.resetPosition()
                }
            }
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
    Item{
        id: container
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
                    //console.debug("platform y:"+entityA.y+"   player Y:"+entityB.y)
                    contact.enabled = false//关闭平台碰撞
                }
            }
        }


        Player{
            id:player
            z:3
            controller: controller
        }
        Platform{
            x:160
            y:500
        }
        Platform{
            x:130
            y:500
        }
        WalkerEnemy{
            x:150
            y:450
        }

        Platform{
            x:300
            y:400
        }

        //        Player{
        //            id:player
        //            x:0
        //            y:0
        //            controller: controller
        //        }
        Mushroom{
            x:500
            y:350
        }
        Star{
            x:400
            y:550
        }

        Coin{
            x:200
            y:500
        }
        Spikeball{
            x:300
            y:550
        }

        RoadBlockGrass{
            x:0
            y:600
            anchors {
                bottom: scene.bottom
                left: scene.left
                right: scene.right
            }
        }

        Finish{
            x:600
            y:550
            onEnd: {
                gameWindow.state="finish"
            }
        }
    }

    Camera{
        id: camera
        gameWindowSize: Qt.point(scene.gameWindowAnchorItem.width,0/*scene.gameWindowAnchorItem.height*/)
        entityContainer: container

        // disable the camera's mouseArea, since we handle the controls of the free
        // moving camera ourself, in EditorUnderlay
        mouseAreaEnabled: false

        // the camera follows the player when not in edit mode
        focusedObject: player

        // set focused offset
        focusOffset: Qt.point(0.5, 0.3)

        // set limits
        limitLeft: 0
        limitBottom: 0

        // set free camera offset, if sidebar is visible
        freeOffset: Qt.point(100,0)
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
        inputActionsToKeyCode: {
            "up": Qt.Key_Up,
            "down": Qt.Key_Down,
            "left": Qt.Key_Left,
            "right": Qt.Key_Right,
            //"fire": Qt.Key_Return
        }

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
                if(Math.abs(player.foot.linearVelocity.x) > 10) player.foot.linearVelocity.x /= 8
                else player.foot.linearVelocity.x = 0
            }
            /*if(!player.islive) {
                    //跳转结束界面
                }*/
        }
    }
}
