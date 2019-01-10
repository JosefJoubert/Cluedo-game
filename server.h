#ifndef SERVER_H
#define SERVER_H

#include <QObject>
#include <QTcpServer>
#include "node.h"
#include <QDebug>
#include <QMap>
#include <QTcpSocket>
#include <QUdpSocket>
#include <QTimer>
#include <QJsonObject>
#include <QJsonDocument>

class Server : public QTcpServer
{
    Q_OBJECT

public:


    Server(QObject *parent = 0, QString servername = NULL);
    //WIll do the basic operations
    void StartServer();

    //Stores player IDs with socketDescriptor eg. 1,508
    QMap<int,int> IDs;

    //Sends a message to all clients, broadcast
    void writeMessage(int ID,QString Message);
    //Saves local IP address
    QHostAddress localIP;
public slots:
    //Connected with clients and is called when a thread receives a message
    void ReceiveMessage(QString message,int ID);
    //Advertises server over UDP
    void broadcast();
    //When the game starts the timer that controls the broadcasting stops
    void stopTimer();
    //When the game starts, only the relevant clients should remain
    void restructure(QList<int> connected);
signals:
    //Connects to thread and sends a message
    void Send(int ID,QString Message);
    void received(int ID,QString Message);
protected:
    //Keeps track of how many players are connected
    int PlayersCount;
    //Stores socketDescriptor and PlayerID combinations
    QMap<int,QTcpSocket*> clients;
    //UDPSocket used for advertising
    QUdpSocket* UDPSocket;
    //Timer used for advertising
    QTimer *timer;
    //Saves the IP address used for advertising
    QHostAddress broadcastIP;

    QString servername;

    //Port used for communication
    int port = 2001;
    //Function used to find local and broadcast IPs
    void getBroadcastIP();
    //Override Incomimg connection to create a thread
    void incomingConnection(qintptr socketDescriptor)Q_DECL_OVERRIDE;



};

#endif // SERVER_H
