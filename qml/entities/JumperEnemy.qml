import QtQuick 2.0

Enemybased {
    variationType:"jumper"
    property bool down: true
    collider.force:Qt.point(0,-50)
    property string img1: "../../assets/opponent/opponent_jumper.png"
    property string img2: "../../assets/opponent/opponent_jumper_dead.png"
    image.source:islive ?img1 : img2//对应图片
    function move(){
        collider.linearVelocity.x=Math.random()*10-5//随机数
        collider.linearVelocity.y=-Math.random()*350//随机数
    }
    collider.fixture.onBeginContact:{
        down=true
    }
    control.onTriggered: {
        if(!islive){
            image.visible=false
            collisionTestingOnlyMode:true//不会受到重力或其他物理力的影响
            collider.collidesWith= obstacles
            //removeEntity()
        }else{
            if(down){
                move()
                down=false
            }
        }
    }

//    Timer{
//        id:control
//        interval: 500//设置触发器之间的间隔，以毫秒为单位
//        repeat: true//在指定的时间间隔内重复触发
//        //running: true
//        onTriggered: {
//            if(!islive){
//                image.visible=false
//                collisionTestingOnlyMode:true//不会受到重力或其他物理力的影响
//                collider.collidesWith= obstacles
//                //removeEntity()
//            }else{
//                if(down){
//                    move()
//                    down=false
//                }
//            }
//        }
//    }
}
