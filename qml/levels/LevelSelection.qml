import QtQuick 2.0
import Felgo 3.0
import "../common"
//重写的关卡选择组件
Flickable {
  id: levelSelectionList

  width: col.width
  height: (col.height < parent.height) ? col.height : parent.height
  contentWidth: col.width
  contentHeight: col.height
  flickableDirection: Flickable.VerticalFlick
  property alias levelMetaDataArray: levelListRepeater.model

  property alias levelColumn: col

  property Component levelItemDelegate: Component{
    /*ButtonBase {
      height: 20
      width: levelSelectionList.width
      text: modelData.levelName
      onClicked: {
        levelSelectionList.levelSelected(modelData)
      }
    }*/
      ButtonBase {
         height: 40
         width: 100
         text: modelData.levelName
         onClicked: {
           levelSelectionList.levelSelected(modelData)
         }
       }
  }// end of levelItemDelegate

  signal levelSelected(variant levelData)

  Grid {
    id: col
    spacing: 10
    //anchors.centerIn: parent
    columns: 5
    Repeater {
      id: levelListRepeater
      // delegate is the default property of Repeater
      delegate: levelItemDelegate

    }// end of Repeater
  }// end of Grid
}// end of Flickable
