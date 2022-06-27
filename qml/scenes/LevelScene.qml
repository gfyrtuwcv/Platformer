import QtQuick 2.0
import Felgo 3.0
import "../entities"
SceneBase {
    id:scene
    Rectangle{
        anchors.fill: parent
        color: "white"
    }

    EntityManager{//实体管理器,管理从实体基础组件派生的所有实体
        id:entityManager
        entityContainer: scene
        dynamicCreationEntityList: [
           Qt.resolvedUrl("../entities/Coin.qml"),
           Qt.resolvedUrl("../entities/MushroomMonster.qml"),
           Qt.resolvedUrl("../entities/Platform.qml"),
           Qt.resolvedUrl("../entities/RoadBlock.qml")
        ]
    }
    LevelEditor{//游戏关卡编辑
        //gameNetworkItem: gameNetwork//用户生成关卡需要的组件id
        toRemoveEntityTypes: ["prop","enemy","obstacles"]//应该删除的实体的数组
        toStoreEntityTypes: ["prop","enemy","obstacles"]//存储关卡可中的实体

        applicationJSONLevelsDirectory: "levels/"//存放关卡的目录
        /*onLevelPublished: {//发布具有关卡Id的级别时，将调用
        }*/

    }
    LevelSelectionList{
            width: 150
            levelMetaDataArray: levelEditor.authorGeneratedLevels
            onLevelSelected: {
                levelEditor.loadSingleLevel(levelData)// LevelSelectionScene传递当前选择的级别信息，其中包含levelMetaData作为levelData参数
            }
    }


    ItemEditor{//项编辑器
         //标记为可编辑
        id:itemEditor
        visible: gameWindow.state === "levelEditing"//状态为levelEditing时可见
        width: 150
        height: parent.height
    }
    Column{
        anchors.right: parent.right

          spacing: 5
          SimpleButton {
            text: "ItemEditor"
            onClicked: itemEditor.visible = !itemEditor.visible
            anchors.right: parent.right
          }
          BuildEntityButton {
                  visible: scene.state === "levelEditing"
                  toCreateEntityTypeUrl: "../entities/RoadBlock.qml"

                  width: 50
                  height: 50
                  anchors.right: parent.right
                  /*Rectangle {
                    color: "grey"
                    anchors.fill: parent
                  }*/
                }
    }

    Row {
           id: buildEntityButtons
           visible: false
           BuildEntityButton {
             anchors.fill: image1
             toCreateEntityTypeUrl: "../entities/RoadBlock.qml"
           }
           BuildEntityButton {
             anchors.fill: image2
             toCreateEntityTypeUrl: "../entities/Platform.qml"
           }
         }
        state: "levelEditing"
         states: [
           State {
             name: "levelEditing"
             PropertyChanges { target: buildEntityButtons; visible: true}
           }
         ]

}
