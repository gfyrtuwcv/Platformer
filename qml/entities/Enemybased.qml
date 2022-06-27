import QtQuick 2.0
import Felgo 3.0
//基础敌人
EntityBaseDraggable {
    entityType: "enemy"
    property alias image: image
    property alias collider: collider
    property bool islive: true
    gridSize: 16//将实体位置捕获到网格中
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
          if(linearVelocity.x > 50) linearVelocity.x = 50
          if(linearVelocity.x < -50) linearVelocity.x = -50
          if(linearVelocity.y > 50) linearVelocity.x = 50
          if(linearVelocity.y < -50) linearVelocity.x = -50
        }
        //collisionTestingOnlyMode:true//使用物理进行碰撞测试，修改实体位置

        bodyType: Body.Dynamic//动态,移动
    }

}
