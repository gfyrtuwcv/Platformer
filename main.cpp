#include <QApplication>
#include <FelgoApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <iostream>
#include "play.h"
// uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
//#include <FelgoLiveClient>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    FelgoApplication felgo;
    QQmlApplicationEngine engine;

    felgo.initialize(&engine);
    felgo.setLicenseKey(PRODUCT_LICENSE_KEY);
    Play data;
    engine.rootContext()->setContextProperty("playdata", data);
    //qmlRegisterType<Enemybased>("based",1,0,"Enemybased");//注册c++类至qml;
    //qmlRegisterType<Obstaclesbased>("based",1,0,"Obstaclesbased");
    //qmlRegisterType<Playerbased>("based",1,0,"Playerbased");
    //qmlRegisterType<Propbased>("based",1,0,"Propbased");
    felgo.setMainQmlFileName(QStringLiteral("qml/Main.qml"));
    engine.load(QUrl(felgo.mainQmlFileName()));
    return app.exec();
}
