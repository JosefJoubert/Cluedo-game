#ifndef NODE_H
#define NODE_H

#include <QObject>
#include <QTcpSocket>
#include <QDebug>
#include <QThread>
#include <QString>

class Node : public QThread
{
    Q_OBJECT
public:
    Node(QTcpSocket* socket,QObject* parent);
    void run() Q_DECL_OVERRIDE;
    QTcpSocket* socket;
signals:
    //Connects to server class and gives over message
    void message(QString message,int ID);
private:
    //Will be used as the ID of the client
    int socketDescriptor;
    void sendAMessage(QString msg);

public slots:
    void readyRead();
    void disconnected();
    void send(int ID,QString message);
    void error(QAbstractSocket::SocketError);

};

#endif // NODE_H
