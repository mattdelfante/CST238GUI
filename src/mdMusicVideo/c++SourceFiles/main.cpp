#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "c++HeaderFiles/Matt.h"
#include "c++HeaderFiles/molli.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    Matt mattObj;
    Molli molliObj;

    engine.rootContext()->setContextProperty("Matt", &mattObj);
    engine.rootContext()->setContextProperty("Molli", &molliObj);

    engine.load(QUrl(QStringLiteral("qrc:/qmlSourceFiles/main.qml")));

    return app.exec();
}
