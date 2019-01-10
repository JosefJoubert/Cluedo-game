#include "clientc.h"


ClientC::ClientC(QObject *parent){
    qDebug() << "This is the constructor for the Client class.";
    this->TCPsocket = new QTcpSocket(this);
    connect(TCPsocket,SIGNAL(readyRead()),this,SLOT(TCPreadyRead()));
    connect(TCPsocket,SIGNAL(error(QAbstractSocket::SocketError)),this,SLOT(TCPError()));
    connect(TCPsocket,SIGNAL(disconnected()),this,SLOT(Disconnected()));

}

void ClientC::connectToServer(QHostAddress server, int port){
    qDebug() << "I'm connecting I swear";
    TCPsocket->abort();
    TCPsocket->connectToHost(server,port);
    timer = new QTimer(this);
    connect(timer,SIGNAL(timeout()),this,SLOT(timeout()));
    timer->start(500);
}


void ClientC::TCPreadyRead(){
    emit received(-1,TCPsocket->readAll());
}

void ClientC::TCPError(){
    qDebug() << "Could not connect to server.";
}

void ClientC::Disconnected(){
    qDebug() << "Disconnected from server.";
}

void ClientC::timeout(){
    delete timer;
    if (TCPsocket->state() == QAbstractSocket::ConnectedState){
        qDebug() << "Connected to server yo";
        emit connected();
    }
    else {
        qDebug() << "Can't connect to server yo.";
        TCPsocket->abort();
    }
}

void ClientC::write(QString JSONMessage){
    TCPsocket->write(JSONMessage.toUtf8());
}
