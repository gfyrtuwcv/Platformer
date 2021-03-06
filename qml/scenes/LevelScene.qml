import QtQuick 2.0
import Felgo 3.0
import "../common"
import "../entities"
SceneBase {
    id:scene
    signal backPressed//返回信号
    width: 960
    height: 640
    property alias levelEditor: levelEditor
    property alias entityManager: entityManager
    property alias level: level
    Rectangle{
        anchors.fill: parent
        color: "white"
    }
    MultiResolutionImage {
       id: image
       x:10
       y:500
       source: "../../assets/player/player.png"
    }
    Item{
        id:level
        height: 640
    }

    MouseArea{
        id:mouseArea
        anchors.fill: parent
        drag.target: level//拖动目标
        //drag.active: true
        drag.axis: Drag.XAxis//沿着x轴拖动
        drag.maximumX: 0
        drag.filterChildren: true//拖动子元素过滤器
    }

    EntityManager{//实体管理器,管理从实体基础组件派生的所有实体
        id:entityManager
        entityContainer: level//scene
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
        //anchors.fill: parent
        Component.onCompleted: levelEditor.loadAllLevelsFromStorageLocation(authorGeneratedLevelsLocation)//加载当前存储位置
        //gameNetworkItem: gameNetwork//用户生成关卡需要的组件id
        toRemoveEntityTypes: ["prop","enemy","obstacles","platform","coin","spilk"]//应该删除的实体的数组
        toStoreEntityTypes: ["prop","enemy","obstacles","platform","coin","spilk"]//存储关卡可中的实体
        currentLevelStorageLocation:authorGeneratedLevelLocation//保存当前加载级别的存储位置
        //存放关卡的目录
        applicationJSONLevelsDirectory: "../../levels/"//查找applicationJSONLevels的目录
        /*onLevelPublished: {//发布具有关卡Id的级别时，将调用
        }*/
        onLevelPublished: {
          // 发布带有levelId的关卡时保存
        }
    }
    LevelSelectionList{
        id:levelSelectionList
        width: 150
        height: parent.height
        visible: false
        anchors.left: parent.left
        levelItemDelegate:componentButton
        levelMetaDataArray: levelEditor.authorGeneratedLevels//applicationJSONLevels//将玩家存储的关卡与关卡列表连接起来
        onLevelSelected: {
            levelEditor.loadSingleLevel(levelData)// LevelSelectionScene传递当前选择的级别信息，其中包含levelMetaData作为levelData参数
        }
        Component{
            id:componentButton
            SimpleButton {
               height: 30
               width: levelSelectionList.width
               text: modelData.levelName
               onClicked: {
                 levelSelectionList.levelSelected(modelData)
               }
             }
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
          SimpleButton {
            text: qsTr("New Level")
            onClicked: levelEditor.createNewLevel()
            anchors.right: parent.right
          }
          SimpleButton {
            text: qsTr("clear")
            onClicked: clear.visible = !clear.visible
            anchors.right: parent.right
          }
          Column{
              id:clear
              visible: false
              spacing: 5
              anchors.right: parent.right
              SimpleButton {
                 anchors.right: parent.right
                 text: qsTr("clear all obstacles")
                 onClicked:entityManager.removeEntitiesByFilter(["obstacles","platform","spilk"])
              }
              SimpleButton {
                 anchors.right: parent.right
                 text: qsTr("clear all prop")
                 onClicked:entityManager.removeEntitiesByFilter(["prop","coin"])
              }
              SimpleButton {
                 anchors.right: parent.right
                 text: qsTr("clear all enemy")
                 onClicked:entityManager.removeEntitiesByFilter(["enemy"])
              }
              SimpleButton {
                 anchors.right: parent.right
                 text: qsTr("clear all")
                 onClicked:entityManager.removeAllEntities()
              }
          }
          SimpleButton {
            text: qsTr("Save")
            onClicked: {
                console.debug("save")
                levelEditor.saveCurrentLevel( {levelMetaData: {levelName: "Mylevels"}})//Mylevels
                //levelEditor.exportLevelAsFile()//写入josn文件
            }
            anchors.right: parent.right
          }
          SimpleButton {
            text: qsTr("Load")
            onClicked: {
                //entityManager.entityContainer=level//scene
                levelSelectionList.visible = !levelSelectionList.visible
                remove.visible = !remove.visible
                //console.debug( levelEditor.currentLevelStorageLocation)
            }

            anchors.right: parent.right
          }/**/
          SimpleButton {
             id:remove
             visible:false
             anchors.right: parent.right
             text: qsTr("Remove Level")
             onClicked:levelEditor.removeCurrentLevel ()//移除关卡
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
        opacity:0.8
        width: 150
        height: 500//parent.height
        visible: true//state === "levelEditing"//状态为levelEditing时可见
        Column{
            spacing: 10
                ButtonBase{
                    text: "ObstaclesEntity"
                    color: obstaclesEntity.visible?"white":"grey"
                    onClicked: obstaclesEntity.visible = !obstaclesEntity.visible
                }
                ButtonBase{
                    text: "PropEntity"
                    color: propEntity.visible?"white":"grey"
                    onClicked: propEntity.visible = !propEntity.visible
                }
                ButtonBase{
                    text: "EnemyEntity"
                    color: enemyEntity.visible?"white":"grey"
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
        ButtonBase{
            anchors.bottom: parent.bottom
            anchors.left:parent.left
            anchors.leftMargin: parent.width/2-width
            width: 20
            height: 15
            text: "^"
            onClicked: buildEntityButtons.visible=!buildEntityButtons.visible
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
