import QtQuick 2.0
import Felgo 3.0
//金币
Propbased{
    id: coin
    entityId: "coin"
    image.source: "../../assets/coin/coin.png"
    collider.fixture.onBeginContact:{
        var other = other.getBody().target
        if(other.entityType === "player"){
            //var num=playdata.coin()//得到金币数量
            //num++
            //playdata.setCoin(num)//金币数量增加
            isCollected=true
            console.debug( isCollected)
        }
    }

    /*CircleCollider{
        id: collected

        radius: parent.width / 2 - 3
        x:3
        y:3

        active: !collected

        bodyType: Body.Static
        collisionTestingOnlyMode: true

        categories: Box.Category6

        collidesWith: Box.Category1
    }

    function collect(){
        console.debug("coin is collected")
        coin.collected = true

        //gameScene.time -= 10
        audioManager.playSound("collectCoin")
    }

    function reset(){
        coin.collected = false
    }*/
}


