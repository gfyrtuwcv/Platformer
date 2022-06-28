import QtQuick 2.0
//星星
Propbased {
    entityId: "star"
    image.source: "../../assets/powerups/star.png"
    collider.fixture.onBeginContact:{
        var other = other.getBody().target
        if(other.entityType === "player"&&!isCollected){
            isCollected=true
            other.isstar=true
        }
    }
}
