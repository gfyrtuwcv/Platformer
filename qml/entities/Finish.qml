import QtQuick 2.0
//终点
Obstaclesbased {
    entityId: "finish"
    image.source: "../../assets/finish/finish.png"
    signal end
    collider.fixture.onBeginContact: {
        //跳转通关界面
        end()
    }
}
