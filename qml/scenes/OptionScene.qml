import QtQuick 2.0
import Felgo 3.0
import "../common"

SceneBase{
    id: optionScene

    signal musicPressed

    signal soundPressed

    signal exitPressed2



    Column{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: 10
        ImageButton {
            id: musicButton
            imageSource: "../../assets/ui/music.png"
            opacity: Settings.musicEnabled ? 0.9 : 0.4

            onClicked: musicPressed()
//            MouseArea{
//                anchors.fill: parent

//                onClicked: {
//                    if(settings.musicEnabled)
//                        settings.musicEnable=false
//                    else
//                        settings.musicEnabled=true
//                }
//            }
        }
        ImageButton{
            id: soundButton
            imageSource: Settings.soundEnabled ? "../../assets/ui/sound_on.png" : "../../assets/ui/sound_off.png"

            opacity: Settings.soundEnabled ? 0.9 : 0.4
            onClicked: soundPressed()
//            MouseArea{
//                anchors.fill: parent

//                onClicked: {
//                    if(settings.soundEnabled){
//                        settings.soundEnabled = false
//                    }
//                    else{
//                        settings.soundEnabled = true

//                        //audioManager.
//                    }
//                }
//            }

        }
        ButtonBase{
            text: "Exit"
            onClicked: exitPressed2()
        }

    }
}
