import QtQuick 2.0
import Felgo 3.0
import "../scenes"
import "../entities"
LevelBase{
    id: level1
    width: 42 * GameScene.gridSize


    RoadBlockDirt{
        id:gd1
        x:0
        y:600
    }

    RoadBlockDirt{
        id:gd2
        anchors.left: gd1.right
        y:gd1.y
    }
    RoadBlockDirt{
        id:gd3
        anchors.left: gd2.right
        y:gd2.y
    }
    RoadBlockDirt{
        id:gd4
        anchors.left: gd3.right
        y:gd3.y
    }
    RoadBlockDirt{
        id:gd5
        anchors.left: gd4.right
        y:gd4.y
    }
    RoadBlockDirt{
        id:gd6
        anchors.left: gd5.right
        y:gd5.y
    }
    RoadBlockDirt{
        id:gd7
        anchors.left: gd6.right
        y:gd6.y
    }
    RoadBlockDirt{
        id:gd8
        anchors.left: gd7.right
        y:gd7.y
    }
    Platform{
        id:pl1
        x:45
        y:500
    }
    Platform{
        id:pl2
        anchors.left: pl1.right
        y:pl1.y
    }
    Platform{
        anchors.left: pl2.right
        y:pl2.y
    }

    Platform{
        id:pl3
        x:190
        y:390
    }
    Platform{
        anchors.left: pl3.right
        y:pl3.y
    }

    Platform{
        id:pl4
        x:300
        y:500
    }
    Platform{
        anchors.left: pl4.right
        y:pl4.y
    }

    Platform{
        id:pl5
        x:320
        y:250
    }
    Platform{
        anchors.left: pl5.right
        y:pl5.y
    }

    Platform{
        id:pl6
        x:500
        y:330
    }
    Platform{
        anchors.left: pl6.right
        y:pl6.y
    }

    Platform{
        id:coinPl
        x:420
        y:gd1.y
    }

    Platform{
        id:pl7
        x:630
        y:440
    }
    Platform{
        anchors.left: pl7.right
        y:pl7.y
    }

    Platform{
        id:pl8
        x:800
        y:250
    }

    Platform{
        id:pl9
        x:960
        y:350
    }

    Platform{
        id:pl10
        x: 1200
        y:400
    }

    RoadBlockDirt{
        id:gd9
        x:1100
        y:gd1.y
    }
    RoadBlockDirt{
        anchors.left: gd9.right
        y:gd9.y
    }
}
