import QtQuick 2.0
//终点
Obstaclesbased {
    entityId: "finish"
    image.source: "../../assets/finish/finish.png"
    signal end//结束信号
    collider.fixture.onBeginContact: {
        end()//发出信号,跳转通关界面
    }
}
