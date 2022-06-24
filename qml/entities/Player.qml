import QtQuick 2.0
import Felgo 3.0
import based 1.0
//玩家
EntityBaseDraggable {
//    Playerbased{

//    }
    entityId: "player1"
    entityType: "player"
    property alias player: player
    property alias image: sprite
    width: sprite.width
    height: sprite.height
    Playerbased{
        id:player
        x:scene.width/2
        y:50
        property int width: image.width
        property int height: image.height
        property alias image: image
        Image {
            id: image
            source: "../assets/player/player.png"
        }
    }
    /*MultiResolutionImage {
        id:sprite
        source: "../assets/player/player.png"
    }*/
    BoxCollider{//物理组件
        anchors.fill: parent
        categories:Box.player//设置碰撞
        collidesWith: Box.prop | Box.enemy | Box.obstacles
        fixture.onBeginContact:{
            var other = other.getBody().target
            if(other.entityType === "coin"){
                other.coin.disappear();//金币消失
                //   +1
            }
            if(other.entityType === "mushroom"){
                player.resultsEnemy(other.mushroom)
            }
        }
    }
}
