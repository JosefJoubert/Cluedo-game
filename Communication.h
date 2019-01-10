#ifndef Communication_H
#define Communication_H
#include <QVector>
#include <QMap>
#include <QTcpServer>
#include <QTcpSocket>
#include <QUdpSocket>
#include <QJsonObject>
#include <QString>
#include <QJsonDocument>
#include <QDebug>
#include <QObject>
#include <QJsonArray>
#include <QDataStream>
#include <QCryptographicHash>
#include "server.h"
#include "clientc.h"
#include "Card.h"
#include "simplecrypt.h"

/**
 * \brief For all network communication purposes
 *
 * Communication: 	This class handles all network related issues.
 *					It is used when data is received or when it is sent
 *					Accross the network.
 */


class Communication : public QObject{
    Q_OBJECT
public slots:
    void ProcessMessage(int playerID,QString MessageJSON);
    void clientConnected();
signals:



    //SIGNALS CAUGHT BY PLAYER CLASS
    void lobbyUpdate(int Count,QString superuser);
    void selectCharacter(QString username,bool Green,bool Peach,bool Peacock,bool Plum,bool Scarlet,bool White);
    void showRequest(bool forme,int accuser,eCard room,eCard weapon,eCard Character);
    void showBroadcast(bool forme,int responder,int Card);
    void accusationResult(QString username,int Room,int Weapon,int Character,bool result);
    void init(eCard card1, eCard card2, eCard card3,QVector<int> playerCharacters);
    void connectFail(bool full);
    void moveRequest(int diceroll,int playerID,bool repeat);
    void boardState(int player1,int player2,int player3,int player4,int player5,int player6);
    void guess();
    void dNotify(int PlayerID);


    //SIGNALS CAUGHT BY GAME CLASS
    void startGame(int connectedplayers);
    void moveResponse(int position);
    void accusationResponse(int accuser,int card1,int card2,int card3);
    void showResponse(int Card);
    void clientConnected(QString username);

private:
    int ACKID = 0;
    int broadcastID = 0;
    int ConnectedPlayers = 0;


    //FOR USE BY SERVER
    QString Sencryptcard(int playerID,int card);
    int Sdecryptcard(int playerID,QString card);
    bool ACKS[6];
    Server* myserver;
    QVector<qint64> passwords;
    QVector<int> connectedclients;
    int superUserID = 0;

    //FOR USE BY CLIENT
    QString Cencryptcard(int card);
    int Cdecryptcard(QString card);
    qint64 mypasswordint;
    QString mypasswordstr;
    QString myusername;
    int myID;
    ClientC *myclient;


    //FOR USE BY BOTH
    QMap<int,QString> usernames;
    QMap<int,int> playerCharacters;
	
public: 


    QString getIP();

    void processShowResponse();

    //When a new client connects this message is broadcasted
    void sendLobbyUpdate(int players);

    //This function will be called when a client needs to connect to a server
    void connectToServer(QString IP,QString Port);

    //Used when AI is spawned
    void connectToLocalHost();

    //Function that receives ACK
    bool processACK(int playerID, bool received);                                       //FOR USE BY SERVER

    //Automated function that replied with ACK. Will be called every time a message is received that requires an ACK
    void sendACK(int ID);                                                               //FOR USE BY CLIENT

    //When a client tries to connect this function will be called
    void sendConnectRequest();                                                           //FOR USE BY CLIENT

    //When the server is full or password doesn't match, a ConnectFail message will be sent //FOR USE BY SERVER
    void sendConnectFail(int PlayerID,bool LobbyFull);

    //It would be complext to reconstruct this message so it has its own function
    void processConnectRequest(int PlayerID,QJsonObject JSON);                          //FOR USE BY SERVER

    //Will be used to set up game when PlayerInit message is received
    void processPlayerInit(QJsonObject JSON);                                           //FOR USE BY CLIENT

    //Will be used to send PlayerInit messages
    void sendPlayerInit(QVector<int> cards);//FOR USE BY SERVER

    //If the player is SuperUser he can send a StartGame message
    void sendStartGame();                                                               //FOR USE BY CLIENT

    //The Super User can start the game. Function should check if the request came from the SuperUser
    void processStartGame(int ID);                                                      //FOR USE BY SERVER

    //Client responds with this message indicating the choice of character (10-15)
    void sendCharacterResponse(int Choice);                                             //FOR USE BY CLIENT

    //This message is sent at the beginning of the turn. It is a broadcast indiciting who's turn it is, and what the diceroll is.
    //If an invalid repsonse is given, this message will be sent again with repeat==true, the client should then give a valid response
    void sendMoveRequest(int Roll, bool repeat, int PlayerID);                          //FOR USE BY SERVER

    //Client uses this message to request to move to Location
    void sendMoveRespnse(int Location);                                                 //FOR USE BY CLIENT

    //The server broadcasts this message to indicate the position of all players
    void sendBoardState(int p1,int p2,int p3, int p4, int p5, int p6);                  //FOR USE BY SERVER

    //When a player enters a room the server will request an accusation
    void sendAccusationRequest(int PlayerID);                                           //FOR USE BY SERVER

    //When an accusation is made this function will be called
    void sendAccusationResponse(eCard Room, eCard Weapon, eCard Character);             //FOR USE BY CLIENT

    //When someone makes an accusation this message will be broadcast
    void sendShowRequest(int Accuser, int Responder, eCard Room, eCard Weapon, eCard Character);//FOR USE BY SERVER

    //The client will then respond to the request with this message
    void sendShowResponse(eCard Card);                                                  //FOR USE BY CLIENT

    //A broadcast telling every client who responded to the accusation
    void sendShowBroadcast(int Responder,int Inquirer, eCard Card,eCard Room, eCard Weapon, eCard Character);   //FOR USE BY SERVER

    //Server's response to a declaration being made
    void sendDeclarationResult(int PlayerID, eCard Room,eCard Weapon,eCard Character, bool result);   //FOR USE BY SERVER

    //Used to notify players that a client has disconnected and was replaced by an AI
    void sendDisconnecteNotify(int playerID);                                            //FOR USE BY SERVER

    //When an AI connects this message is sent to update it on all the information it has access to
    void SendInfo(QString msg);                                                         //FOR USE BY SERVER

    //This function will be used by the AI to process information. This function will deconstruct the message and
    //send it on to the appropriate AI class
    void processSendInfo(QJsonObject msg);


    //Constructor for Communication class. Username and Password are unimportant if spawned by server
    Communication(QObject *parent = 0,bool server = true,QString name = NULL);


    //A simple function that checks if ACK has been received from all clients and gives the ID of the last ACK received
    int checkACKS();

};
#endif
