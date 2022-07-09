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
    property alias time: time
    //property alias foot: foot
    property int savex: 10//存储的玩家位置
    property int savey: 500
    x:savex
    y:savey
    property string normalimg: "../../assets/player/player.png"
    property string starimg: "../../assets/player/player_rainbow.png"
    property bool isstar: false//是否吃到星星
    property bool noinvincible: true//不无敌
    property bool islive: true//是否存活
    property int isjump: 0
    property int life : 3//生命
    property int size:1//大小
    property int coinnum:0//金币数量
    property int propnum:0//道具数量
    property int timenum:0//闯关时间
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
       source: noinvincible ?normalimg : starimg
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
        force:Qt.point(controller.xAxis*17*30,0)//持续力量
        onLinearVelocityChanged: {
          if(linearVelocity.x > 170) linearVelocity.x = 170
          if(linearVelocity.x < -170) linearVelocity.x = -170
        }
        fixture.onBeginContact:{
            var other = other.getBody().target
            if(other.entityType === "obstacles" || other.entityType ==="platform"){
                isjump=0//重置跳跃次数
            }
            if(other.entityType ==="spilk" && noinvincible){
                die()
            }
            if(other.entityType ==="enemy"&&other.islive && noinvincible){
                isjump=1
                if((parent.y+parent.height)>=(other.y+other.height)){
                    die()
                }else other.islive=false
            }
        }
    }
    Timer{
        id:invincible//无敌时间
        interval: 1500//设置触发器之间的间隔，以毫秒为单位
        repeat: false//在指定的时间间隔内重复触发
        onTriggered: {
            repeat = false
            if(isstar==true) repeat=true//吃星星触发两次
            if(isstar==false) noinvincible=true
            isstar=false
        }
    }

    Timer{
        id:jumpControl
        interval: 20//设置触发器之间的间隔，以毫秒为单位
        repeat: false//在指定的时间间隔内重复触发
        onTriggered: {
            if(isjump<3){
                collider.applyLinearImpulse(Qt.point(0,-310))
                //collider.linearVelocity.y=-350
            }
        }
    }
    Timer{
        id:time//记录闯关时间
        interval:1000
        repeat: true
        onTriggered: {
            timenum++
        }
    }

    onIsstarChanged: {
        noinvincible = false
        audioManager.playSound("playerInvincible")
        invincible.start()//无敌时间
    }
    onIsliveChanged: {//end
        time.stop()
        audioManager.playSound("finish")
        gameWindow.state="finish"
    }

    function resetPosition(){//重置
        collider.linearVelocity.x=0
        collider.linearVelocity.y=0
        x=savex
        y=savey
        life=3
        size=1
        coinnum=0
        propnum=0
        timenum=0
        sizeChang()
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
            audioManager.playSound("playerJump")
        }
    }
    function die(){//死
        //collider.applyLinearImpulse(Qt.point(-200, -120))
        collider.linearVelocity.x=-200
        collider.linearVelocity.y=-150
        if(size>1){
            size--
            sizeChang()
            audioManager.playSound("playerHit")
        }else{
            life--
            audioManager.playSound("playerHit")
            console.debug("your remain "+life+" life")
            noinvincible=false
            invincible.start()
            if(life<1) {
                //islive = true
                console.debug("your die")
                islive = false
                audioManager.playSound("playerDefeated")
            }
        }
    }

}

