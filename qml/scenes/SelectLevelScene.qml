import QtQuick 2.0
import Felgo 3.0
import "../common"
import "../levels"
//关卡选择
SceneBase{
    id:selectLevelScene

    //
    signal levelPressed(string selectedLevel)
    signal levelplay(variant levelData)
    signal productPressed
    property var levelEditor
    Rectangle{
        anchors.fill: parent.gameWindowAnchorItem
        color: "#00ffff"
    }

    ButtonBase{
        text: qsTr("Production levels")

        anchors.bottom: selectLevelScene.bottom
        anchors.topMargin: 8

        anchors.right: selectLevelScene.right
        anchors.rightMargin: 8

        onClicked: productPressed()
    }

    ButtonBase{
        text: qsTr("Back")

        anchors.top: selectLevelScene.top
        anchors.topMargin: 8

        anchors.right: selectLevelScene.right
        anchors.rightMargin: 8

        onClicked: backButtonPressed()
    }
    ButtonBase{
        text: qsTr("Demo")

        anchors.top: selectLevelScene.top
        anchors.topMargin: 15
        anchors.left: selectLevelScene.left
        anchors.leftMargin: 50
        onClicked: {
            mylevel.visible = false
            demolevel.visible = !demolevel.visible
        }
    }
    ButtonBase{
        text: qsTr("Mylevel")

        anchors.top: selectLevelScene.top
        anchors.topMargin: 15
        anchors.left: selectLevelScene.left
        anchors.leftMargin: 150
        onClicked:{
            demolevel.visible = false
            mylevel.visible = !mylevel.visible
        }
    }
    LevelSelection{
        id:demolevel
        width: 150
        height: 150
        visible: true
        anchors.top: selectLevelScene.top
        anchors.topMargin: 60
        anchors.left: parent.left
        anchors.leftMargin: 30
        //anchors.centerIn: parent
        levelMetaDataArray: levelEditor.applicationJSONLevels//将自带的关卡与关卡列表连接起来
        onLevelSelected: {
            levelEditor.loadSingleLevel(levelData)// LevelSelectionScene传递当前选择的级别信息，其中包含levelMetaData作为levelData参数
            levelplay(levelData)
        }
    }

    LevelSelection{
        id:mylevel
        width: 150
        height: 150
        visible: false
        anchors.top: selectLevelScene.top
        anchors.topMargin: 60
        anchors.left: parent.left
        anchors.leftMargin: 30
        //anchors.centerIn: parent
        levelMetaDataArray: levelEditor.authorGeneratedLevels//将玩家存储的关卡与关卡列表连接起来
        onLevelSelected: {
            levelEditor.loadSingleLevel(levelData)// LevelSelectionScene传递当前选择的级别信息，其中包含levelMetaData作为levelData参数
            levelplay(levelData)
        }
    }

    /*Grid{
        anchors.centerIn: parent
        spacing:10
        columns: 5
        ButtonBase{
            text: "1"
            width: 50
            height: 50
            onClicked: {
                levelPressed("GameScene.qml")
            }
        }
        ButtonBase{
            text: "2"
            width: 50
            height: 50
            onClicked: {
                levelPressed("Level2.qml")
            }
        }
        ButtonBase{
            text: "3"
            width: 50
            height: 50
            onClicked: {
                levelPressed("Level3.qml")
            }
        }
        Repeater{
            model: 12
            ButtonBase{
                width: 50
                height: 50
            }
        }
    }*/

}
