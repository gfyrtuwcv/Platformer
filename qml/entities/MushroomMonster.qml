import QtQuick 2.0
import Felgo 3.0
import based 1.0
//蘑菇怪
EntityBaseDraggable{
    id:mushroomblame
    entityId: "mushroom"
    entityType: "enemy"
    property alias mushroom: mushroom
    property alias image: sprite
    width: sprite.width
    height: sprite.height
    Enemybased{
        id:mushroom
    }
    MultiResolutionImage {
        id:sprite
        source: "../assets/powerups/mushroom.png"
    }
    BoxCollider{//物理组件
        anchors.fill: parent

        categories:Box.enemy
        collidesWith: Box.player | Box.obstacles//定义为只能和玩家碰撞

        collisionTestingOnlyMode:false//使用物理进行碰撞测试，修改实体位置

        bodyType: Body.active//动态,移动
        //fixture.onBeginContact: {

                    // 当与另一个实体碰撞时，
          //      }
    }
}
