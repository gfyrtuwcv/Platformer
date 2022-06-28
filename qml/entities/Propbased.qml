import QtQuick 2.0
import Felgo 3.0
//基础道具
EntityBaseDraggable {
    entityType: "prop"

    property alias image: image
<<<<<<< HEAD
    property alias colliderBox: colliderBox
    property bool isCollected: false//是否被收集
=======
    property alias collider: collider
    property bool isCollected: false//是否被收集
    image.visible: !isCollected
    gridSize: 16//将实体位置捕获到网格中
    colliderSize: width
>>>>>>> origin/main
    width: image.width
    height: image.height
    MultiResolutionImage {
        id:image
    }
    BoxCollider{//物理组件
        id:colliderBox
        anchors.fill: parent
        categories:prop
        collidesWith: player | obstacles//定义碰撞
        collisionTestingOnlyMode:true//使用物理进行碰撞测试，但不修改实体位置
        bodyType: Body.Static//静态,不移动
        /*fixture.onBeginContact: {// 当与另一个实体碰撞时，

<<<<<<< HEAD
        }
    }    
=======
        }*/
    }
>>>>>>> origin/main
}
