import QtQuick 2.0
import Felgo 3.0
import "../common"
import "../entities"
SceneBase {
    id:scene
    signal backPressed//返回信号
    Rectangle{
        anchors.fill: parent
        color: "white"
    }

    EntityManager{//实体管理器,管理从实体基础组件派生的所有实体
        id:entityManager
        entityContainer: scene
        dynamicCreationEntityList: [
           Qt.resolvedUrl("../entities/Coin.qml"),
           Qt.resolvedUrl("../entities/Finish.qml"),
           Qt.resolvedUrl("../entities/JumperEnemy.qml"),
           Qt.resolvedUrl("../entities/Mushroom.qml"),
           Qt.resolvedUrl("../entities/Platform.qml"),
           Qt.resolvedUrl("../entities/RoadBlockDirt.qml"),
           Qt.resolvedUrl("../entities/RoadBlockGrass.qml"),
           Qt.resolvedUrl("../entities/Spikeball.qml"),
           Qt.resolvedUrl("../entities/Star.qml"),
           Qt.resolvedUrl("../entities/WalkerEnemy.qml")
        ]
    }
    LevelEditor{//游戏关卡编辑
        id:levelEditor
        //gameNetworkItem: gameNetwork//用户生成关卡需要的组件id
        toRemoveEntityTypes: ["prop","enemy","obstacles"]//应该删除的实体的数组
        toStoreEntityTypes: ["prop","enemy","obstacles"]//存储关卡可中的实体
        //存放关卡的目录
        applicationJSONLevelsDirectory: "../../levels/"//查找applicationJSONLevels的目录
        /*onLevelPublished: {//发布具有关卡Id的级别时，将调用
        }*/

    }
    LevelSelectionList{
            width: 150
            levelMetaDataArray: levelEditor.authorGeneratedLevels//将玩家存储的关卡与关卡列表连接起来
           /* onLevelSelected: {
                levelEditor.loadSingleLevel(levelData)// LevelSelectionScene传递当前选择的级别信息，其中包含levelMetaData作为levelData参数
            }*/
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
          /*SimpleButton {
            text: "ItemEditor"
            onClicked: itemEditor.visible = !itemEditor.visible
            anchors.right: parent.right
          }*/
          SimpleButton {
            text: qsTr("Entity")
            onClicked: buildEntityButtons.visible = !buildEntityButtons.visible
            anchors.right: parent.right
          }
          /*SimpleButton {
            text: qsTr("clear")
            onClicked: entityManager.removeAllEntities()//clear.visible = !clear.visible
            anchors.right: parent.right
          }
          Column{
              id:clear
              visible: false
              anchors.right: parent.right
              SimpleButton {
                 text: qsTr("clear all obstacles")
                 onClicked:entityManager.removeEntitiesByFilter(["obstacles"])
              }
              SimpleButton {
                 text: qsTr("clear all prop")
                 onClicked:entityManager.removeEntitiesByFilter(["prop"])
              }
              SimpleButton {
                 text: qsTr("clear all enemy")
                 onClicked:entityManager.removeEntitiesByFilter(["enemy"])
              }
              SimpleButton {
                 text: qsTr("clear all")
                 onClicked:entityManager.removeEntitiesByFilter(["obstacles","prop","enemy"])
              }
          }*/
          SimpleButton {
            text: qsTr("New Level")
            onClicked: levelEditor.createNewLevel()
            anchors.right: parent.right
          }
          SimpleButton {
            text: qsTr("Save")
            onClicked: levelEditor.exportLevelAsFile ()//nativeUtils.displayTextInput("Enter levelName","",levelEditor.currentLevelName)
            anchors.right: parent.right

            Connections{
                target: nativeUtils//显示消息框和输入对话框组件
                onTextInputFinfished:{
                   // if(accepted) {
                        levelEditor.saveCurrentLevel( {levelMetaData: {levelName: enteredText}} )//保存已加载关卡的当前LevelData,只读，并且会随着每一次关卡操作(如保存、加载或创建新关卡)而更新。
                        levelEditor.exportLevelAsFile ()
                   // }
                }
            }
          }
          SimpleButton {
            text: qsTr("Load")
            //onClicked: buildEntityButtons.visible = !buildEntityButtons.visible
            anchors.right: parent.right
          }
          SimpleButton {
            text: qsTr("Back")
            onClicked: backPressed()
            anchors.right: parent.right
          }
    }

    Rectangle {
        id: buildEntityButtons
        anchors.left: parent.left
        color: "gray"
        //anchors.bottom: parent.bottom
        width: 150
        height: parent.height
        visible: true//state === "levelEditing"//状态为levelEditing时可见
        Column{
            spacing: 10
                ButtonBase{
                    text: "ObstaclesEntity"
                    onClicked: obstaclesEntity.visible = !obstaclesEntity.visible
                }
                ButtonBase{
                    text: "PropEntityEntity"
                    onClicked: propEntity.visible = !propEntity.visible
                }
                ButtonBase{
                    text: "PropEntityEntity"
                    onClicked: enemyEntity.visible = !enemyEntity.visible
                }
            Grid{
                id:obstaclesEntity
                visible:true
                spacing: 5
                BuildEntityButton {
                    toCreateEntityTypeUrl: "../entities/RoadBlockGrass.qml"
                    width: 30
                    height: 30
                    Image {
                        source: "../../assets/ground/ground_grass.png"
                        anchors.fill: parent
                    }
                }
                BuildEntityButton {
                    toCreateEntityTypeUrl: "../entities/RoadBlockDirt.qml"
                    width: 30
                    height: 30
                    Image {
                        source: "../../assets/ground/ground_dirt.png"
                        anchors.fill: parent
                    }
                }
                BuildEntityButton {
                    toCreateEntityTypeUrl: "../entities/Platform.qml"
                    width: 30
                    height: 30
                    Image {
                        source: "../../assets/platform/platform.png"
                        anchors.fill: parent
                    }
                }
                BuildEntityButton {
                    toCreateEntityTypeUrl: "../entities/Spikeball.qml"
                    width: 30
                    height: 30
                    Image {
                        source: "../../assets/spikeball/spikeball.png"
                        anchors.fill: parent
                    }
                }
                BuildEntityButton {
                    toCreateEntityTypeUrl: "../entities/Finish.qml"
                    width: 30
                    height: 30
                    Image {
                        source: "../../assets/finish/finish.png"
                        anchors.fill: parent
                    }
                }
            }
            Grid{
                id:propEntity
                visible:false
                spacing: 5
                BuildEntityButton {
                    toCreateEntityTypeUrl: "../entities/Coin.qml"
                    width: 30
                    height: 30
                    Image {
                        source: "../../assets/coin/coin.png"
                        anchors.fill: parent
                    }
                }
                BuildEntityButton {
                    toCreateEntityTypeUrl: "../entities/Mushroom.qml"
                    width: 30
                    height: 30
                    Image {
                        source: "../../assets/powerups/mushroom.png"
                        anchors.fill: parent
                    }
                }
                BuildEntityButton {
                    toCreateEntityTypeUrl: "../entities/Star.qml"
                    width: 30
                    height: 30
                    Image {
                        source: "../../assets/powerups/star.png"
                        anchors.fill: parent
                    }
                }
            }
            Grid{
                id:enemyEntity
                visible:false
                spacing: 5
                BuildEntityButton {
                    toCreateEntityTypeUrl: "../entities/JumperEnemy.qml"
                    width: 30
                    height: 30
                    Image {
                        source: "../../assets/opponent/opponent_jumper.png"
                        anchors.fill: parent
                    }
                }
                BuildEntityButton {
                    toCreateEntityTypeUrl: "../entities/WalkerEnemy.qml"
                    width: 30
                    height: 30
                    Image {
                        source: "../../assets/opponent/opponent_walker.png"
                        anchors.fill: parent
                    }
                }
            }
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
