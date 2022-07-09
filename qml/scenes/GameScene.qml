import QtQuick 2.0
import Felgo 3.0
import "../entities"
import "../common"
import "../levels"

SceneBase{//游戏场景
    id:gameScene
    width: 960
    height: 640
    gridSize: 32
    property string activeLevelFileName
    property var levelData
    property int time: 0
    signal backButtonPressed3
    property int offx:240
    property alias container: container
    property alias player: player
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
    Row{
        anchors.top: parent.top
        anchors.left: parent.left
        Rectangle{
            color: "gray"
            width: 60
            height: 30
            opacity:0.4//透明度
            Text {
                id: live
                anchors.centerIn: parent
                color: "red"
                font.pixelSize: 20
                text: qsTr("life:"+player.life)
            }
        }
        Rectangle{
            color: "gray"
            width: 60
            height: 30
            opacity:0.4//透明度
            MultiResolutionImage {
                id: coinimg
                source: "../../assets/coin/coin.png"
            }
            Text {
                id: coin
                anchors.centerIn: parent
                color: "red"
                font.pixelSize: 20
                text: qsTr("   :"+player.coinnum)
            }
        }
        Rectangle{
            color: "gray"
            width: 70
            height: 30
            opacity:0.4//透明度
            Text {
                id: time
                anchors.centerIn: parent
                color: "red"
                font.pixelSize: 20
                text: qsTr("time:"+player.timenum)
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
        //z:-10
        //transformOrigin: Item.TopLeft
        width: parent.width
        height: parent.height
        signal starLevel(var levelData)

        onStarLevel:{
            player.resetPosition()
            player.time.start()
            console.debug("start")
            entityManager.entityContainer=container
            levelEditor.loadSingleLevel(levelData)
        }

        PhysicsWorld {//模拟物理世界,包含所有物理实体
            id:physicsWorld
            property int gravitY: 15
            gravity: Qt.point(0, gravitY)//重力
            running: true//暂停游戏时设置为false
            updatesPerSecondForPhysics:30//物理世界每秒更新的频率
            velocityIterations: 5//速度的迭代
            positionIterations: 5//位置的迭代
            z:10//在实体上绘制debugDraw
            //debugDrawVisible: true//设置为true查看物理系统的调试图

            onPreSolve: {
                //this is called before the Box2DWorld handles contact events
                var entityA = contact.fixtureA.getBody().target
                var entityB = contact.fixtureB.getBody().target
                if(entityB.entityType === "platform" && entityA.entityType === "player" &&
                        entityB.y  < entityA.y + entityA.height) {
                  //console.debug("A y:"+entityA.y+"   B Y:"+entityB.y)
                  contact.enabled = false//关闭平台碰撞
                   }
                if(entityA.entityType === "platform" && entityB.entityType === "player" &&
                        entityA.y  < entityB.y + entityB.height){
                    contact.enabled = false//关闭平台碰撞
                }
            }
        }
        Player{
            id:player
            z:3
            controller: controller
        }

        EntityBase{
         id:resetSensor//边界检测
         entityType: "resetSeneor"
         x:player.x
         y:parent.height
         width: player.width
         height: 10
         //signal contact
         BoxCollider{
             anchors.fill: parent
             collisionTestingOnlyMode: true//仅碰撞测试
             categories:resetSensor
             collidesWith:player
             fixture.onBeginContact: {
                  var other = other.getBody().target
                 if(other.entityType === "player"){
                     player.resetPosition()
                 }
             }
         }
         Rectangle{
             anchors.fill: parent
             color:"red"
         }
        }
    }

    Camera{//相机
        id: camera
        gameWindowSize:Qt.point(gameScene.width,0)
        entityContainer: container
        mouseAreaEnabled: false
        focusedObject: player//相机焦点
        focusOffset: Qt.point(0.5, 0.3)
        limitLeft: 0//gamescene.width
        limitBottom: 0
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
        running: gameWindow.state==="game"?true:false//启动计时器
        repeat: true//在指定的时间间隔内重复触发
        onTriggered: {//超时触发
            var xAxis = controller.xAxis;
            if(xAxis === 0) {
                //player.foot.linearVelocity.x = 0
                if(Math.abs(player.collider.linearVelocity.x) > 10) player.collider.linearVelocity.x /= 5
                else player.collider.linearVelocity.x = 0
            }
        }
    }
}
