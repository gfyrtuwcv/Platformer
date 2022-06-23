import QtQuick 2.0
import Felgo 3.0
import based 1.0
//道路方块
EntityBaseDraggable {
    entityId: "road"
    entityType: "obstacles"
    property alias road: road
    property alias image: sprite
    width: sprite.width
    height: sprite.height
    Obstaclesbased{
        id:road
    }
    MultiResolutionImage {
        id:sprite
        source: "../assets/ground/ground_grass.png"
    }
    BoxCollider{//物理组件
        anchors.fill: parent

        categories:Box.obstacles
        collidesWith: Box.player | Box.enemy | Box.prop //定义碰撞

        collisionTestingOnlyMode:true//使用物理进行碰撞测试，但不修改实体位置

        bodyType: Body.Static//静态,不移动
        //fixture.onBeginContact: {

                    // 当与另一个实体碰撞时，
          //      }
    }
}
