import QtQuick 2.0
import Felgo 3.0
//图片按钮类
Rectangle{
    id: imageButton

    radius: 10

    width: buttonImage.width+paddingHorizontal
    height: buttonImage.height+paddingVertical

    color: "#ffffff"
    //从图片元素到左右两侧矩形的水平边距
    property int paddingHorizontal: 2
    //从图片元素到顶部和底部矩形的垂直边距
    property int paddingVertical: 2

   property alias imageSource: buttonImage.source

    signal clicked

    MultiResolutionImage {
        id: buttonImage
        anchors.centerIn: parent.Center

        fillMode: Image.PreserveAspectFit
    }
    MouseArea{
        id:mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: imageButton.clicked()
        onPressed: imageButton.opacity = 0.5
        onReleased: imageButton.opacity = 1
    }
}
