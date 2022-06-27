import QtQuick 2.0
import Felgo 3.0
//蘑菇道具
Enemybased{
    id:mushroomblame
    entityId: "mushroom"
    image.source: "../../assets/powerups/mushroom.png"
    //property alias mushroom: mushroom

    property bool collected: false

    image.visible: !collected

    colliderComponent: collider

    BoxCollider{
        id: collider

        width: parent.width - 2
        height: parent.height - 2
        anchors.centerIn: parent

        active: !collected

        bodyType: Body.Static
        collisionTestingOnlyMode: true

        categories: Box.Category6
        collidesWith: Box.Category1
    }

    function collect(){
        console.debug("mushroom is collected")
    }
}
