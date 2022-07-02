import QtQuick 2.0
import Felgo 3.0
//金币
Propbased{
    id: coin
    entityType: "coin"
    image.source: "../../assets/coin/coin.png"
    property int num: 0//coin
    collider.fixture.onBeginContact:{
        var other = other.getBody().target
        if(other.entityType === "player"&&!isCollected){
            num++//金币数量增加
            isCollected=true
            console.debug(num)
            playdata.coinnum=num
        }
    }
}


