import QtQuick 2.0
import Felgo 3.0
//基础敌人
EntityBaseDraggable {
    entityType: "enemy"
    property alias image: image
    property alias collider: collider
    width: image.width
    height: image.height
    MultiResolutionImage {
        id:image
    }
    BoxCollider{//物理组件
        id:collider
        anchors.fill: parent

        categories: enemy
        collidesWith: player | obstacles//定义为只能和玩家碰撞
        //collisionTestingOnlyMode:true//使用物理进行碰撞测试，修改实体位置

        bodyType: Body.Dynamic//动态,移动
    }

}
