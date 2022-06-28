import QtQuick 2.0
import Felgo 3.0
//蘑菇道具
Propbased{
    id:mushroomblame
    entityId: "mushroom"
    image.source: "../../assets/powerups/mushroom.png"
<<<<<<< HEAD
    colliderBox.fixture.onBeginContact:{
=======
    collider.fixture.onBeginContact:{
>>>>>>> origin/main
        var other = other.getBody().target
        if(other.entityType === "player"&&!isCollected){
            isCollected=true
            other.size++
            other.sizeChang()
        }
    }
<<<<<<< HEAD

=======
>>>>>>> origin/main
}

