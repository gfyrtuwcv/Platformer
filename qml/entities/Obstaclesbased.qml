import QtQuick 2.0
import Felgo 3.0
//基础障碍
EntityBaseDraggable {
    entityType: "obstacles"
    property alias image: image
    property alias collider: collider
    width: image.width
    height: image.height
    id:platform
    MultiResolutionImage {
        id:image
    }
    BoxCollider{//物理组件
        id: collider
        anchors.fill: parent

        categories:obstacles
        collidesWith: player | enemy | prop //定义碰撞

        friction:0.5//使物体沿着彼此真实地滑动
        /*restitution:0.1//来使物体弹跳的
        sensor:true//对碰撞做出反应
        density: 0.1//密度*/
        bodyType: Body.Static//静态,不移动

        //fixture.beginContact: {//两个fixture开始相互碰撞

        //}
    }
}
