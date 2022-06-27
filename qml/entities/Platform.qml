import QtQuick 2.0
import Felgo 3.0
//平台
Obstaclesbased {
    entityId: "platform"
    entityType: "platform"
    image.source: "../../assets/platform/platform.png"
    collider.categories:playform
    collider.collidesWith: player | enemy | prop //定义碰撞
    collider.fixture.onBeginContact: {
        var otherEntity = other.getBody().target
        if(otherEntity.entityType === "player"){
            //collider.enabled=false
            //collider.collidesWith=player | enemy | prop //| playerfoot//collisionTestingOnlyMode=true//collidesWith= prop | enemy | obstacles// | platform
        }
    }

    collider.fixture.onEndContact: {//停止相互碰撞时，调用
        var otherEntity = other.getBody().target
        if(otherEntity.entityType === "player"&&otherEntity.y>=y){
            //enabled=true
             //collider.collisionTestingOnlyMode=false
        }
    }/*

    /*collider.fixture.onBeginContact: {
        var otherEntity = other.getBody().target
        if(otherEntity.entityType === "player") {
          console.debug("contact platform begin")
          player.contacts++
        }
      }

      collider.fixture.onEndContact: {
        var otherEntity = other.getBody().target
        if(otherEntity.entityType === "player") {
          console.debug("contact platform end")
          player.contacts--
        }
      }*/
}
