import QtQuick 2.0
import Felgo 3.0
//玩家
EntityBaseDraggable {
    //entityId: "Player"
    entityType: "player"
    property alias image: image
    property alias collider: collider
    property alias foot: foot
    property int isjump: 0
    property int size:1//大小
    property bool islive: true//是否存活
    /*property int contacts: 0
    state: contacts > 0 ? "walking" : "jumping"//不同状态切换*/
    property var controller
    //gridSize: 16//将实体位置捕获到网格中
    //colliderSize: width
    width: image.width
    height: image.height
    MultiResolutionImage {
       id: image
       source: "../../assets/player/player.png"
    }
    BoxCollider{//物理组件
        id:collider
        anchors.fill: parent
        categories:player//设置碰撞
        height: parent.height
        collidesWith: prop | enemy | obstacles | platform
        density: 3//密度
        active: true
        bodyType: Body.Dynamic//动态身体
        fixedRotation: true//不希望主体旋转
        collisionTestingOnlyMode:true//不会受到重力或其他物理力的影响

        /*force:Qt.point(controller.xAxis*1700*2800,0)//持续力量Qt.point(1000,0)
        onLinearVelocityChanged: {
          if(linearVelocity.x > 150) linearVelocity.x = 150
          if(linearVelocity.x < -150) linearVelocity.x = -150
        }*/
        fixture.onBeginContact:{
            var other = other.getBody().target
            if(other.entityType === "coin"){
                //other.coin.disappear();//金币消失
                //   +1
            }
            if(other.entityType === "mushroom"){
                //player.resultsEnemy(other.mushroom)
            }
            if(other.entityType === "obstacles" || other.entityType ==="platform"){
                isjump=0;
            }
            if(other.entityType ==="spilk"){
                die()
            }
            if(other.entityType ==="enemy"){
                if(y>=other.y){
                    die()
                }
            }
        }
    }

    BoxCollider{
        id:foot
        //categories:player//设置碰撞
        categories:playerfoot//设置碰撞
        collidesWith: enemy | obstacles | platform
        bodyType: Body.Dynamic//动态身体
        height:1
        anchors.bottom: parent.bottom
        force:Qt.point(controller.xAxis*17*25,0)//持续力量
        onLinearVelocityChanged: {
          if(linearVelocity.x > 170) linearVelocity.x = 170
          if(linearVelocity.x < -170) linearVelocity.x = -170
        }
        fixture.onBeginContact:{
            var other = other.getBody().target
            if(other.entityType ==="enemy"){
                other.islive=false
            }
        }
    }/**/

    Timer{
        id:jumpControl
        interval: 20//设置触发器之间的间隔，以毫秒为单位
        repeat: false//在指定的时间间隔内重复触发
        onTriggered: {
            if(isjump<3){
                foot.linearVelocity.y = -350
            }
        }
    }

    function jump(){
        if(isjump <2){
            isjump++
            jumpControl.start()
        }
    }
    function die(){
        size--
        if(size<1) {
            console.debug("your die")
            islive= false
        }
    }
}

