#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "game.h"
#include "Card.h"
#include "enums.h"
#include "Communication.h"
#include "player.h"
#include "udplistener.h"
#include <QTcpSocket>
#include <QDebug>
#include <QHostAddress>
#include <QObject>
#include <QQmlComponent>
#include <QMetaObject>
#include <algorithm>
#include <random>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Game ServerClass;
    Player ClientClass;
    UDPListener udp;
    engine.rootContext()->setContextProperty("GameClass",&ServerClass);
    engine.rootContext()->setContextProperty("Me",&ClientClass);
    engine.rootContext()->setContextProperty("UDP",&udp);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    return app.exec();





}
