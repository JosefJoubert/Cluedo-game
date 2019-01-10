#include "server.h"


Server::Server(QObject *parent, QString servername) : QTcpServer(parent)
{
    qDebug() << "This is the constructor for the Server class.";
    this->PlayersCount = 0;
    this->getBroadcastIP();
    this->servername = servername;
    this->IDs.insert(-1,-1);

}

void Server::incomingConnection(qintptr socketDescriptor)
{
    qDebug() << "New client connecting:" << socketDescriptor;

    QTcpSocket* temp = new QTcpSocket(this);
    this->IDs.insert(socketDescriptor,this->PlayersCount);
    qDebug() << "Inserting into IDs" << socketDescriptor << PlayersCount;
    temp->setSocketDescriptor(socketDescriptor);

    //Start new Thread
    Node *newclient = new Node(temp,this);
    connect(newclient,SIGNAL(finished()),newclient,SLOT(deleteLater()));
    newclient->start();

    //Add socket to list of pointers to QTcpSocket
    this->clients.insert(temp->socketDescriptor(),temp);

    //When a thread emits that it received a message, this class receives the message
    connect(newclient,SIGNAL(message(QString,int)),this,SLOT(ReceiveMessage(QString,int)));

    //When this class emits that it wants to send a message, it is received by a thread
    connect(this,SIGNAL(Send(int,QString)),newclient,SLOT(send(int,QString)));

    //PlayersCount just holds an int with how many players are connected
    this->PlayersCount++;




}


//This function will find the broadcast address of this network
void Server::getBroadcastIP()
{
    QTcpSocket socket;
    socket.connectToHost("8.8.8.8",53);
    if (socket.waitForConnected()){
        qDebug() << "local IPv4 address is:" << socket.localAddress().toString();
    }
    else{
        qDebug() << "Could not connect. Possible that there is not internet connection.";
    }
    this->localIP = socket.localAddress();
    QString str(socket.localAddress().toString());
    int last = str.lastIndexOf(".");
    str.replace(last+1,str.length()-last,"255");
    broadcastIP.setAddress(str);
    qDebug() << "The broadcast address is:" << broadcastIP.toString();
    UDPSocket = new QUdpSocket(this);
}

//Advertises server over network
void Server::broadcast(){
    QJsonObject msg;
    msg.insert("Type",-5);
    msg.insert("Name",this->servername);
    msg.insert("IP",this->localIP.toString());
    msg.insert("Port",this->port);
    QByteArray message = QJsonDocument(msg).toJson();
    UDPSocket->writeDatagram(message,this->broadcastIP,2001);
}

//Stops timer that broadcasts over UDP
void Server::stopTimer(){
    this->timer->stop();
    qDebug() << "Timer stopped";
}


//When clients connecting to the server, clients are assigned a in the order they are connecting, however
//these clients are not necessarily in the game. When the game is started this function will be called to
//so that the variable IDs only contains the socket descriptors of clients in the game. The rest will be forgotten
void Server::restructure(QList<int> connected){
    QList<int> temp;
    for (int a =0;a< connected.size();a++){
        temp.push_back(IDs.value(connected.at(a)));
    }
    this->IDs.clear();
    for (int a = 0; a < connected.size();a++){
        IDs.insert(a,temp.at(a));
    }

}

void Server::StartServer(){
    if(!this->listen(QHostAddress::Any,2001)) {
        qDebug() << "Could not start server.";
    }
    else{
        qDebug() << "Server started.";
    }
    timer = new QTimer(this);
    timer->start(1000);
    connect(timer,SIGNAL(timeout()),this,SLOT(broadcast()));
}

void Server::writeMessage(int ID,QString msg)
{
    //Emit send message signal that will be picked up by node class
    emit this->Send(IDs.key(ID),msg);

}

void Server::ReceiveMessage(QString Message,int ID){
    qDebug() << "I received a message from" << ID << "which is player:" << this->IDs.value(ID);

    //Throws the message over to the Communication protocol
    emit received(this->IDs.value(ID),Message);
}


