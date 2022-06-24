import QtQuick 2.0

Rectangle{
    id: textButton

    //通过文本的尺寸动态匹配按钮的大小
    width: buttonText.width+ paddingHorizontal*2
    height: buttonText.height+ paddingVertical*2

    radius: 10

    color: "#ffffff"
    //从文本元素到左右两侧矩形的水平边距
    property int paddingHorizontal: 8
    //从文本元素到顶部和底部矩形的垂直边距
    property int paddingVertical: 8

    property alias text: buttonText.text

    signal clicked

    Text{
        id:buttonText
        anchors.centerIn: parent
        font.pixelSize: 16
        color: "black"
    }
    MouseArea{
        id:mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: textButton.clicked()
        onPressed: textButton.opacity = 0.5
        onReleased: textButton.opacity = 1
    }
}
