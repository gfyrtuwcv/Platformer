import QtQuick 2.0
import Felgo 3.0
//敌人基础类
EntityBaseDraggable {
    entityType: "enemy"
    property alias image: image
    property alias collider: collider
    property alias control: control
    property bool islive: true
    gridSize: 32//将实体位置捕获到网格中
    //gridSize: 16//将实体位置捕获到网格中
    colliderSize: width
    width: image.width
    height: image.height
    MultiResolutionImage {
        id:image
    }
    BoxCollider{//物理组件
        id:collider
        anchors.fill: parent
        active: true
        categories: enemy
        collidesWith: player | obstacles | playform//定义碰撞
        force:Qt.point(50,-50)//持续力量
        onLinearVelocityChanged: {
          if(linearVelocity.x > 150) linearVelocity.x = 150
          if(linearVelocity.x < -150) linearVelocity.x = -150
          if(linearVelocity.y > 150) linearVelocity.x = 150
          if(linearVelocity.y < -150) linearVelocity.x = -150
        }
        //collisionTestingOnlyMode:true//使用物理进行碰撞测试，修改实体位置

        bodyType: Body.Dynamic//动态,移动
    }
    Timer{
        id:control
        interval: 300//设置触发器之间的间隔，以毫秒为单位
        repeat: true//在指定的时间间隔内重复触发
        running: gameWindow.state === "game"?true:false
    }

}
