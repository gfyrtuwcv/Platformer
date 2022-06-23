import QtQuick 2.0
import Felgo 3.0
import based 1.0
//平台
EntityBaseDraggable {
    entityId: "platform"
    entityType: "obstacles"
    property alias platform: platform
    property alias image: sprite
    width: sprite.width
    height: sprite.height
    Obstaclesbased{
        id:platform
    }
    Image {
        id:sprite
        source: "../assets/platform/platform.png"
    }
    BoxCollider{//物理组件
        anchors.fill: parent

        categories:Box.obstacles
        collidesWith: Box.player | Box.enemy | Box.prop //定义碰撞

        bodyType: Body.Static//静态,不移动
        //fixture.onBeginContact: {

                    // 当与另一个实体碰撞时，
          //      }
    }
}
