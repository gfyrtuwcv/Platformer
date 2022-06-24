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

    signal optionPressed

    Image {
        id: menuBackGround
        source: "../../assets/backgroundImage/day_bg.png"
        anchors.fill: parent
    }

    Text{
        anchors.horizontalCenter: parent.horizontalCenter
        y: 30
        font.pixelSize: 30
        color: "#e9e9e9"
        text: "kid闯闯闯"
    }

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

    Common.ImageButton{
        id: optionButton
        imageSource: "../../assets/ui/options.png"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        onClicked: optionPressed()
    }


}
