import QtQuick 2.0

Enemybased {
    property int direction: 1//方向
    collider.force:Qt.point(direction*10,0)
    property string img1: "../../assets/opponent/opponent_walker.png"
    property string img2: "../../assets/opponent/opponent_walker_dead.png"
    image.source:islive ?img1 : img2//对应图片
    function move(){
        if(collider.linearVelocity.x === 0) collider.linearVelocity.x=direction*50
        //collider.linearVelocity.y=-Math.random()*350//随机数
        //console.debug(collider.linearVelocity.x)
    }
    collider.fixture.onBeginContact: {
        direction=-direction//变向
    }

    collider.fixture.onEndContact:{
        direction=-direction//变向
    }
    Timer{
        id:control
        interval: 500//设置触发器之间的间隔，以毫秒为单位
        repeat: true//在指定的时间间隔内重复触发
        //running: true
        onTriggered: {
            if(!islive){
                image.visible=false
                collisionTestingOnlyMode:true//不会受到重力或其他物理力的影响
                collider.collidesWith= obstacles
                //removeEntity()
            }else{
                move()
            }
        }
    }
}
