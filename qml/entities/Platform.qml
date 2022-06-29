import QtQuick 2.0
import Felgo 3.0
//平台
Obstaclesbased {
    //entityId: "platform"
    id: platform
    entityType: "platform"
    image.source: "../../assets/platform/platform.png"
    collider.categories: playform
    collider.collidesWith: player | enemy | prop //定义碰撞
/*    collider.fixture.onBeginContact: {
        var otherEntity = other.getBody().target
        if(otherEntity.entityType === "player"){
        }
    }

    collider.fixture.onEndContact: {//停止相互碰撞时，调用
        var otherEntity = other.getBody().target
        if(otherEntity.entityType === "player"&&otherEntity.y>=y){
            //enabled=true
             //collider.collisionTestingOnlyMode=false
        }
    }*/
}
