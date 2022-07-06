import QtQuick 2.0

Enemybased {
    variationType:"jumper"
    property bool down: true
    collider.force:Qt.point(1,-50)
    property string img1: "../../assets/opponent/opponent_jumper.png"
    property string img2: "../../assets/opponent/opponent_jumper_dead.png"
    image.source:islive ?img1 : img2//对应图片
    function move(){
        collider.linearVelocity.x=Math.random()*50-25//随机数
        collider.linearVelocity.y=-Math.random()*200//随机数
    }
    collider.fixture.onBeginContact:{
        down=true
    }
    control.onTriggered: {
        if(!islive){
            image.visible=false
            collider.collisionTestingOnlyMode=true//不会受到重力或其他物理力的影响
        }else{
            if(down){
                move()
                down=false
            }
        }
    }
}
