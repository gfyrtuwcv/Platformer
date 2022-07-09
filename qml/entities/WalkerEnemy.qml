import QtQuick 2.0
import Felgo 3.0
//行走敌人
Enemybased {
    variationType:"walker"
    property int direction: -1//方向
    property int dirline: 0//防止不动
    collider.force:Qt.point(direction*50,0)
    property string img1: "../../assets/opponent/opponent_walker.png"
    property string img2: "../../assets/opponent/opponent_walker_dead.png"
    image.source:islive ?img1 : img2//对应图片
    function move(){
        if(collider.linearVelocity.x === 0) collider.linearVelocity.x=direction*150
        if(collider.linearVelocity.x === -150 ||collider.linearVelocity.x === 150) dirline++
        if(dirline>3){
            collider.linearVelocity.x*=-1
            dirline=0
        }
        //console.debug(collider.linearVelocity.x)
    }

    collider.fixture.onEndContact:{
        direction=-direction//变向
    }
    control.onTriggered: {
        if(!islive){
            image.visible=false
            audioManager.playSound("walkerMonsterDefeated")
            collider.collisionTestingOnlyMode=true//不会受到重力或其他物理力的影响
        }else{
            move()
        }
    }
}
