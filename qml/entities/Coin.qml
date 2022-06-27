import QtQuick 2.0
import Felgo 3.0
//金币
Propbased{
    id: coin
    entityId: "coin"

    property bool collected: false
    //property alias coins: coin

    image.visible: !collected

    colliderComponent: collider
    image.source: "../../assets/coin/coin.png"

    CircleCollider{
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
    }
}


