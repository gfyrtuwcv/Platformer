import QtQuick 2.0
import Felgo 3.0
import based 1.0
//玩家
EntityBaseDraggable {
    Playerbased{

    }
    BoxCollider{//物理组件
        categories:player
        collidesWith: prop
    }
}
