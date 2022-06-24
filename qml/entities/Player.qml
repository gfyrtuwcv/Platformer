import QtQuick 2.0
import Felgo 3.0
//玩家
EntityBaseDraggable {
    entityId: "Player"
    entityType: "player"
    property alias image: image
    property alias collider: collider
    property var controller
    width: image.width
    height: image.height
    MultiResolutionImage {
       id: image
       source: "../../assets/player/player.png"
    }
    /*MultiResolutionImage {
        id:sprite
        source: "../assets/player/player.png"
    }*/
    BoxCollider{//物理组件
        id:collider
        anchors.fill: parent
        categories:player//设置碰撞
        collidesWith: prop | enemy | obstacles
        density: 3//密度
        active: true
        bodyType: Body.Dynamic//动态身体
        force:Qt.point(controller.xAxis*1700*2800,0)//持续力量Qt.point(1000,0)
        onLinearVelocityChanged: {
          if(linearVelocity.x > 150) linearVelocity.x = 150
          if(linearVelocity.x < -150) linearVelocity.x = -150
        }
        fixture.onBeginContact:{
            var other = other.getBody().target
            if(other.entityType === "coin"){
                //other.coin.disappear();//金币消失
                //   +1
            }
            if(other.entityType === "mushroom"){
                //player.resultsEnemy(other.mushroom)
            }
        }
    }
}
