import QtQuick 2.0
import Felgo 3.0
import "../common"

SceneBase{
    id: finishScene
    property var player
    //当"Restart"按钮按下时，该信号触发
    signal restartPressed
    //当"Levels"按钮按下时，该信号触发
    signal levelsPressed
    //当图片按钮按下时，该信号触发
    signal menuPressed

    Image{
        id: finishBackGround
        source: "../../assets/backgroundImage/day_bg.png"
        anchors.fill: parent
    }
    Text {
        visible: !player.islive
        anchors.horizontalCenter: parent.horizontalCenter
        y:30
        font.pixelSize: 20
        text: qsTr("挑战失败，请再接再厉")
    }
    Text {
        visible: player.islive
        anchors.horizontalCenter: parent.horizontalCenter
        y:30
        font.pixelSize: 20
        text: qsTr("恭喜通关!")
    }
     Column{
         visible: player.islive
         anchors.horizontalCenter: parent.horizontalCenter
         y:80
         Text {
             text: qsTr("你的用时为："+player.timenum+"秒")
         }
         Text {
             text: qsTr("剩余的生命："+player.life+"条")
         }
         Text {
             text: qsTr("收集的金币数量："+player.coinnum+"个")
         }
         Text {
             text: qsTr("吃到的道具数量："+player.propnum+"个")
         }
     }

    Row{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        spacing: 20

        ButtonBase{
            text: qsTr("Restart")
            onClicked: restartPressed()
        }
        ButtonBase{
            text: qsTr("Levels")
            onClicked: levelsPressed()
        }
        ImageButton{
            imageSource: "../../assets/ui/home.png"
            onClicked: menuPressed()
        }
    }
}
