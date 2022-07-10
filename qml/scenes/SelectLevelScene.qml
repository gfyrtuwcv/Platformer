import QtQuick 2.0
import Felgo 3.0
import "../common"
import "../levels"
import "../entities"
//关卡选择
SceneBase{
    id:selectLevelScene
    //signal levelPressed(string selectedLevel)
    signal levelplay(variant levelData)
    signal productPressed
    property var levelEditor
    Image {
        id: selectLevelBackGround
        source: "../../assets/backgroundImage/night_bg.png"
        anchors.fill: parent
    }

    ButtonBase{
        text: qsTr("Production levels")
        color: "grey"

        anchors.bottom: selectLevelScene.bottom
        anchors.topMargin: 8

        anchors.right: selectLevelScene.right
        anchors.rightMargin: 8

        onClicked: productPressed()
    }

    ButtonBase{
        text: qsTr("Back")
        color: "grey"

        anchors.top: selectLevelScene.top
        anchors.topMargin: 8

        anchors.right: selectLevelScene.right
        anchors.rightMargin: 8

        onClicked: backButtonPressed()
    }
    ButtonBase{
        text: qsTr("Demo")
        color: "grey"

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
        color: "grey"

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
            //levelEditor.loadSingleLevel(levelData)// LevelSelectionScene传递当前选择的级别信息，其中包含levelMetaData作为levelData参数
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
            //levelEditor.loadSingleLevel(levelData)// LevelSelectionScene传递当前选择的级别信息，其中包含levelMetaData作为levelData参数
            levelplay(levelData)
        }
    }

}
