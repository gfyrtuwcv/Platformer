import QtQuick 2.0
import Felgo 3.0
//基础障碍
EntityBaseDraggable {
    id:obstaclesbased
    entityType: "obstacles"
    property alias image: image
    property alias collider: collider
    property bool isdeath: false//是否致命
    width: image.width
    height: image.height
    gridSize: 16//将实体位置捕获到网格中
    colliderSize: width
    MultiResolutionImage {
        id:image
    }
    BoxCollider{//物理组件
        id: collider
        anchors.fill: parent

        categories:obstacles
        collidesWith: player | enemy | prop //定义碰撞

        friction:0.8//使物体沿着彼此真实地滑动
        restitution:0//来使物体弹跳的
        sensor:false//对碰撞做出反应
        density: 0//密度
        bodyType: Body.Static//静态,不移动

        /*EditableComponent{//可编辑的属性
                editableType: "Road"
                defaultGroup: "Obstacles"
                properties: {
                  "friction": {"min": 0, "max": 100, "label": "Friction"},
                  "restitution": {"min": 0, "max": 100, "label": "Restitution"},
                }
            }*/
    }
}
