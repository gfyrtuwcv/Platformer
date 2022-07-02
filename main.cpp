#include <QApplication>
#include <FelgoApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <iostream>
#include "Play.h"
// uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
//#include <FelgoLiveClient>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    FelgoApplication felgo;
    QQmlApplicationEngine engine;
    //int num=0;
    felgo.initialize(&engine);
    felgo.setLicenseKey(PRODUCT_LICENSE_KEY);
    Play *data;
    engine.rootContext()->setContextProperty("playdata", data);//data.coin QVariant::fromValue(num)
    felgo.setMainQmlFileName(QStringLiteral("qml/Main.qml"));
    engine.load(QUrl(felgo.mainQmlFileName()));
    return app.exec();
}
