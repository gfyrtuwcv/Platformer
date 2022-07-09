import QtQuick 2.0
import Felgo 3.0
import "../common"

SceneBase{
    id: optionScene

    signal musicPressed

    signal soundPressed

    signal exitPressed2

    signal backButtonPressed2


    Column{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 10
        ImageButton {
            id: musicButton
            imageSource: "../../assets/ui/music.png"
            opacity: Settings.musicEnabled ? 0.9 : 0.4

            onClicked: musicPressed()
            MouseArea{
                anchors.fill: parent

                onClicked: {
                    if(Settings.musicEnabled)
                        Settings.musicEnable=false
                    else
                        Settings.musicEnabled=true
                }
            }
        }
        ImageButton{
            id: soundButton
            imageSource: Settings.soundEnabled ? "../../assets/ui/sound_on.png" : "../../assets/ui/sound_off.png"

            opacity: Settings.soundEnabled ? 0.9 : 0.4
            onClicked: soundPressed()
            MouseArea{
                anchors.fill: parent

                onClicked: {
                    if(Settings.soundEnabled){

                        Settings.soundEnabled = false
                    }
                    else{
                        Settings.soundEnabled = true

                        audioManager.playSound("playerJump")
                    }
                }
            }

        }
        ButtonBase{
            text: qsTr("Exit")
            onClicked: exitPressed2()
        }

    }

    ButtonBase{
        text: qsTr("Back")
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        onClicked: backButtonPressed2()
    }
}
