#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "c++HeaderFiles/mytimer.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    MyTimer myTimer;

    engine.rootContext()->setContextProperty("MyTimer", &myTimer);

    QCoreApplication::setApplicationName("MyHouseMusicVideo");
    QCoreApplication::setOrganizationName("(MD^2)");
    QCoreApplication::setOrganizationDomain(".com");

    QString directory = app.applicationDirPath();
    engine.rootContext()->setContextProperty("AppDir", directory);

    engine.load(QUrl(QStringLiteral("qrc:/qmlSourceFiles/main.qml")));

    return app.exec();
}
