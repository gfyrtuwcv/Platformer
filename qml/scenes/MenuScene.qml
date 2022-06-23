import QtQuick 2.0
import Felgo 3.0
import "../common" as Common

SceneBase{
    id: menuScene
    //当“Levels”按钮按下时，该信号触发
    signal selectLevelPressed
    //当“Credit”按钮按下时，该信号触发
    signal creditPressed
    //当“Exit”按钮按下时，该信号触发
    signal exitPressed

//    Image {
//        id: menuBackGround
//        source: "file"
//        anchors.fill: parent
//    }

    Column{
        anchors.centerIn: parent
        spacing: 8

        Common.ButtonBase{
            text: "Levels"
            onClicked: selectLevelPressed()
        }

        Common.ButtonBase{
            text: "Credit"
            onClicked: creditPressed()
        }

        Common.ButtonBase{
            text: "Exit"
            onClicked: exitPressed()
        }

    }

    Common.ButtonBase{
        text: "Options"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
    }


}
