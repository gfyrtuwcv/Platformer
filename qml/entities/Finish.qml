import QtQuick 2.0
//终点
Obstaclesbased {
    variationType: "finish"
    image.source: "../../assets/finish/finish.png"
    signal end//结束信号
    collider.fixture.onBeginContact: {
        var other = other.getBody().target
        if(other.entityType === "player"){
            end()//发出信号,跳转通关界面
        }
    }
}
