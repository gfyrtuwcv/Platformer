import QtQuick 2.0
import Felgo 3.0

Scene{
    // 游戏窗口的尺寸
    //“逻辑大小”-场景内容自动缩放以匹配
    width: 480
    height: 320
    //游戏场景的不透明度，默认为0,不可见
    opacity: 0
    //游戏场景是否可见，当不透明度大于0时窗口可见
    visible: opacity > 0
    //当场景可见时，该场景可用
    enabled: visible
}
