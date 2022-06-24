import QtQuick 2.0
import Felgo 3.0
import based 1.0
//金币
EntityBaseDraggable{
    entityId: "coin"
    entityType: "prop"
    property alias coins: coin
    property alias image: sprite
    width: sprite.width
    height: sprite.height

    Propbased{
        id:coin

    }
    Image {
        id:sprite
    }
    BoxCollider{//物理组件
        anchors.fill: parent

        categories:prop
        collidesWith: player//定义为只能和玩家碰撞

        collisionTestingOnlyMode:true//使用物理进行碰撞测试，但不修改实体位置

        bodyType: Body.Static//静态,不移动

        fixture.onBeginContact: {
                    // 当与另一个实体碰撞时，
                }
    }
}


