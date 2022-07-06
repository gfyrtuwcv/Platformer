import QtQuick 2.0
import Felgo 3.0
//金币
Propbased{
    id: coin
    entityType: "coin"
    image.source: "../../assets/coin/coin.png"
    collider.fixture.onBeginContact:{
        var other = other.getBody().target
        if(other.entityType === "player"&&!isCollected){
            other.coinnum++//金币数量增加
            isCollected=true
        }
    }
}


