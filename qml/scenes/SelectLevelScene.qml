import QtQuick 2.0
import Felgo 3.0
import "../common"

SceneBase{
    id:selectLevelScene

    //
    signal levelPressed(string selectedLevel)
    signal productPressed

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

    Grid{
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
    }
}
