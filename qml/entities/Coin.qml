import QtQuick 2.0
import Felgo 3.0
//金币
Propbased{
    id: coin
    entityId: "coin"

    image.visible: !isCollected

    colliderComponent: colliderCircle
    image.source: "../../assets/coin/coin.png"

    CircleCollider{
        id: colliderCircle

        radius: parent.width / 2 - 3

        x:3
        y:3

        active: !isCollected

        bodyType: Body.Static//静态实体，不移动
        collisionTestingOnlyMode: true//使用物理进行碰撞测试，但不修改实体位置

        categories: prop

        collidesWith: player | obstacles
    }

    function collect(){
        console.debug("coin is collected")
        coin.collected = true

        //gameScene.time -= 10
        audioManager.playSound("collectCoin")
    }

    function reset(){
        coin.collected = false
    }
}


