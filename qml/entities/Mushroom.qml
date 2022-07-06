import QtQuick 2.0
import Felgo 3.0
//蘑菇道具
Propbased{
    id:mushroomblame
    variationType: "mushroom"
    image.source: "../../assets/powerups/mushroom.png"
    collider.fixture.onBeginContact:{
        var other = other.getBody().target
        if(other.entityType === "player"&&!isCollected){
            isCollected=true
            other.propnum++
            other.size++
            other.sizeChang()
        }
    }
}

