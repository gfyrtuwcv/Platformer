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
}
