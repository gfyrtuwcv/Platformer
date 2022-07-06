import QtQuick 2.0
//终点
Obstaclesbased {
    variationType: "finish"
    image.source: "../../assets/finish/finish.png"
    collider.fixture.onBeginContact: {
        var other = other.getBody().target
        if(other.entityType === "player"){
            other.time.stop()
            gameWindow.state ="finish"//跳转通关界面
        }
    }
}
