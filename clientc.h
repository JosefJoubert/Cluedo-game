#ifndef CLIENT_H
#define CLIENT_H
#include <QUdpSocket>
#include <QDebug>
#include <QHostAddress>
#include <QObject>
#include <QJsonObject>
#include <QJsonDocument>
#include <QTcpSocket>
#include <QTimer>

class ClientC : public QObject
{
    Q_OBJECT
public:
    ClientC(QObject* parent = 0);
    void connectToServer(QHostAddress server,int port);
    QHostAddress serverIP;
    int serverPort = -1;
    void write(QString JSONMessage);
    QTimer* timer;
public slots:
    void TCPreadyRead();
    void TCPError();
    void Disconnected();
    void timeout();
signals:
    void received(int ID,QString msg);
    void connected();
private:
    QString serverName;
    QTcpSocket* TCPsocket;

};

#endif // CLIENT_H
