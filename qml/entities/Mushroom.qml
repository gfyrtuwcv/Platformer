import QtQuick 2.0
import Felgo 3.0
//蘑菇道具
Propbased{
    id:mushroomblame
    entityId: "mushroom"
    image.source: "../../assets/powerups/mushroom.png"
    colliderBox.fixture.onBeginContact:{
        var other = other.getBody().target
        if(other.entityType === "player"){
        }
    }

}

