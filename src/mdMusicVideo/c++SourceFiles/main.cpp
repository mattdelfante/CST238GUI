#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "c++HeaderFiles/matt.h"
#include "c++HeaderFiles/molli.h"
#include "c++HeaderFiles/musicvideo.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    Matt mattObj;
    Molli molliObj;
    MusicVideo mvObj;

    engine.rootContext()->setContextProperty("Matt", &mattObj);
    engine.rootContext()->setContextProperty("Molli", &molliObj);
    engine.rootContext()->setContextProperty("MusicVideoObj", &mvObj);

    QCoreApplication::setApplicationName("MyHouseMusicVideo");
    QCoreApplication::setOrganizationName("(MD^2)");
    QCoreApplication::setOrganizationDomain(".com");

    engine.load(QUrl(QStringLiteral("qrc:/qmlSourceFiles/main.qml")));

    return app.exec();
}
