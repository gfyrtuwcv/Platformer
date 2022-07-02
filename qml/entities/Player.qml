import QtQuick 2.0
import Felgo 3.0
//玩家
EntityBaseDraggable {
    //entityId: "Player"
    id:player
    entityType: "player"
    //signal end
    property alias image: image
    property alias collider: collider
    property alias foot: foot
    property int savex: 0//存储的玩家位置
    property int savey: 0
    x:savex
    y:savey
    property string normalimg: "../../assets/player/player.png"
    property string starimg: "../../assets/player/player_rainbow.png"
    property bool isstar: false//是否吃到星星
    property bool noinvincible: true//不无敌
    property int isjump: 0
    property int life : 3//生命
    property int size:1//大小
    property bool islive: true//是否存活
    /*property int contacts: 0
    state: contacts > 0 ? "walking" : "jumping"//不同状态切换*/
    property var controller: controller
    gridSize: 32
    //gridSize: 16//将实体位置捕获到网格中
    //colliderSize: width
    width: image.width
    height: image.height
    MultiResolutionImage {
       id: image
       source: isstar ?starimg : normalimg
    }
    BoxCollider{//物理组件
        id:collider
        anchors.fill: parent
        categories:player//设置碰撞
        height: parent.height
        collidesWith: prop | enemy | obstacles | platform
        //density: 3//密度
        active: true
        bodyType: Body.Dynamic//动态身体
        fixedRotation: true//不希望主体旋转
        fixture.onBeginContact:{
            var other = other.getBody().target
            if(other.entityType === "obstacles" || other.entityType ==="platform"){
                isjump=0;
            }
            if(other.entityType ==="spilk" && noinvincible){
                die()
            }
            if(other.entityType ==="enemy"&&other.islive && noinvincible){
                if((y+height)<=other.y){
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
        force:Qt.point(controller.xAxis*17*30,0)//持续力量
        onLinearVelocityChanged: {
          if(linearVelocity.x > 170) linearVelocity.x = 170
          if(linearVelocity.x < -170) linearVelocity.x = -170
        }
        fixture.onBeginContact:{
            var other = other.getBody().target
            if(other.entityType ==="enemy" && noinvincible){
                other.islive=false
//                if((y+parent.height)<other.y) other.islive=false
//                else die()
            }
            if(other.entityType ==="spilk" && noinvincible){
                die()
            }
        }
    }
    Timer{
        id:invincible//无敌时间
        interval: 3000//设置触发器之间的间隔，以毫秒为单位
        repeat: false//在指定的时间间隔内重复触发
        onTriggered: {
            isstar=false
            noinvincible=true
        }
    }

    Timer{
        id:jumpControl
        interval: 20//设置触发器之间的间隔，以毫秒为单位
        repeat: false//在指定的时间间隔内重复触发
        onTriggered: {
            if(isjump<3){
                foot.linearVelocity.y = -700
            }
        }
    }

    onIsstarChanged: {
        invincible.start()//无敌时间
        noinvincible = false
    }
    onIsliveChanged: {//end
        gameWindow.state="finish"
    }

    function resetPosition(){//重置
        x=savex
        y=savey
        life=3
        size=1
        sizeChang()
        foot.linearVelocity.x=0
        foot.linearVelocity.y=0
        isstar= false//是否吃到星星
        noinvincible= true
        isjump= 0
        islive= true//是否存活
    }

    function sizeChang(){//改变大小
        if(size>2) size=2
        console.debug(image.width+"   "+image.height)
        if(size==2){
            image.width+=size*15
            image.height+=size*15

        }else{
            image.width=64
            image.height=64
        }
    }

    function jump(){//跳
        if(isjump <2){
            isjump++
            jumpControl.start()
        }
    }
    function die(){//死
        if(size>1) {
            size--
            sizeChang()
        }else{
            life--
            console.debug("your remain "+life+" life")
            isstar=true
            noinvincible=false
            if(life<1) {
                //islive = true
                console.debug("your die")
                islive = false
            }
        }
    }

}

