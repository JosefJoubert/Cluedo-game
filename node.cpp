#include "node.h"

Node::Node(QTcpSocket *socket, QObject* parent) : QThread(parent)
{
    this->socketDescriptor = socket->socketDescriptor();
    qDebug() << "Starting client: " << socketDescriptor;
    this->socket = socket;

}

//Will write a message to the socket
void Node::sendAMessage(QString msg)
{
     this->socket->write(msg.toStdString().c_str());
}



void Node::run()
{
    //Connect readyRead slot to signal. The Socket will emit a readyRead signal when it receives a message
    connect(socket,SIGNAL(readyRead()),this,SLOT(readyRead()),Qt::DirectConnection);
    //When client disconnects it will delete the socket
    connect(socket,SIGNAL(disconnected()),this,SLOT(disconnected()),Qt::DirectConnection);
    connect(socket,SIGNAL(error(QAbstractSocket::SocketError)),this,SLOT(error(QAbstractSocket::SocketError)),Qt::DirectConnection);

    qDebug() << "Connected: " << socketDescriptor;

    exec();
}

//Function will be called when QTcpSocket emits readyRead signal, meaning there is something to be read.
void Node::readyRead(){
    QByteArray data = socket->readAll();
    emit message(data,socketDescriptor);
}

void Node::disconnected(){
    socket->deleteLater();
    qDebug() << socketDescriptor << " disconnected.";
    exit(0);

}

void Node::send(int ID,QString message)
{
    //If ID = 1 it will send the message because it is a broadcast
    if (ID != -1){
        //If it is not a broadcast, it will quickly check if this is meant for this thread
        if (ID != this->socketDescriptor){
            return;
        }
    }
    //QThread::sleep(5);
    this->sendAMessage(message);
}

void Node::error(QAbstractSocket::SocketError)
{
    qDebug() << "Socket error, may have disconnected.";
}
