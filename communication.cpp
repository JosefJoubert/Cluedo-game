#include "Communication.h"
#include <iostream>

QString Communication::Sencryptcard(int playerID,int card){
    SimpleCrypt crypto(this->passwords.at(playerID));
    QString encryptedcard = crypto.encryptToString(QString("%1").arg(card));
    return encryptedcard;
}

int Communication::Sdecryptcard(int playerID, QString card){
    SimpleCrypt crypto(this->passwords.at(playerID));
    int decryptedcard = crypto.decryptToString(card).toInt();
    return decryptedcard;
}

QString Communication::Cencryptcard(int card){
    SimpleCrypt crypto(this->mypasswordint);
    QString encryptedcard = crypto.encryptToString(QString("%1").arg(card));
    return encryptedcard;
}

int Communication::Cdecryptcard(QString card){
    SimpleCrypt crypto(this->mypasswordint);
    int decryptedcard = crypto.decryptToString(card).toInt();
    return decryptedcard;
}

QString Communication::getIP()
{
    return this->myserver->localIP.toString();
}

void Communication::sendLobbyUpdate(int players)
{
    QJsonObject msg;
    msg.insert("Type",3);
    msg.insert("ID",0);
    msg.insert("Players",players);
    msg.insert("SuperUser",usernames.value(this->superUserID));
    QString message = QJsonDocument(msg).toJson();
    this->myserver->writeMessage(-1,message);

}

void Communication::connectToServer(QString IP, QString Port){

    QHostAddress address(IP);


    int port = Port.toInt();
    if (port == 0) {
        qDebug() << "INVALID PORT";
        return;
    }
    if (address.toString() == ""){
        qDebug() << "INVALID IP ADDRESS";
        return;
    }
    this->myclient->connectToServer(address,port);
}

void Communication::connectToLocalHost()
{
    qDebug() << "Connecting to localhost";
    QHostAddress local = QHostAddress::LocalHost;
    connectToServer(local.toString(),"2001");
}

bool Communication::processACK(int playerID, bool received){
    if (received == true){
        this->ACKS[playerID] = true;
    }
    qDebug() << "I received an ACK from:"<< playerID;
}

//A simple message to send an ACK to the server
void Communication::sendACK(int ID){
    //Increment the ACK ID number
    this->ACKID = this->ACKID + ID;

    QJsonObject msg;
    msg.insert("Type",0);
    msg.insert("ID",this->ACKID);
    msg.insert("Acknowledgement",1);
    QString message = QJsonDocument(msg).toJson();
    this->myclient->write(message);
}

void Communication::sendConnectRequest(){
    QJsonObject msg;
    msg.insert("Type",1);
    msg.insert("Username",this->myusername);

    //Create MD5Hash
    QByteArray usernamepassword = myusername.toUtf8() + mypasswordstr.toUtf8();
    QString MD5Hash = QCryptographicHash::hash(usernamepassword,QCryptographicHash::Md5).toHex();

    msg.insert("MD5Hash",MD5Hash);
    QString JSONMessage = QJsonDocument(msg).toJson();
    this->myclient->write(JSONMessage);

}

void Communication::sendConnectFail(int PlayerID, bool LobbyFull){
    QJsonObject msg;
    msg.insert("Type",2);
    msg.insert("LobbyFull",LobbyFull);
    QString message = QJsonDocument(msg).toJson();
    this->myserver->writeMessage(PlayerID,message);
}

void Communication::processConnectRequest(int PlayerID, QJsonObject JSON){
    if (this->ConnectedPlayers == 6){
        this->sendConnectFail(PlayerID,true);
    }
    else {
        qDebug() << "Another client has connected.";
        this->connectedclients.push_back(PlayerID);
        this->usernames[ConnectedPlayers] = JSON.value("Username").toString();
        qDebug() << "Inserted username:" << JSON.value("Username").toString();
        this->ConnectedPlayers++;
        this->sendLobbyUpdate(ConnectedPlayers);
        this->clientConnected(JSON.value("Username").toString());
    }

}

void Communication::processPlayerInit(QJsonObject JSON)
{
    //Set up player's order
    //Set up player's character
    //Mark player's cards
    qDebug() << "Processing PlayerInit message...";
    QJsonArray PIArray = JSON.value("PlayerInfo").toArray();
    QVector<int> characters;
    int card1;
    int card2;
    int card3;
    for (int it = 0; it < PIArray.size();it++){
        this->usernames[it] = PIArray.at(it).toObject().value("Username").toString();
        if (this->myusername == usernames.value(it)){
            this->myID == it;
            //Decrypt field
            //Assign three cards as own
            card1 = this->Cdecryptcard(PIArray.at(it).toObject().value("Card1").toString());
            card2 = this->Cdecryptcard(PIArray.at(it).toObject().value("Card2").toString());
            card3 = this->Cdecryptcard(PIArray.at(it).toObject().value("Card3").toString());
            //throw cards over to GUI
            //GUI should throw cards over to Player class
        }
        //this->playerCharacters[it] = PIArray.at(it).toObject().value("Character").toInt();
        characters.append(PIArray.at(it).toObject().value("Character").toInt());
    }
    emit init(eCard(card1),eCard(card2),eCard(card3),characters);

}

void Communication::sendPlayerInit(QVector<int> cards){
    QJsonObject msg;
    qDebug() << usernames;

    msg.insert("Type",7);
    msg.insert("ID",this->broadcastID);

    //Increase the broadcast ID number
    this->broadcastID = this->broadcastID + 1;

    QJsonArray PIArray;
    QJsonObject PlayerInfo;

    //PlayerInfo for Player 1
    PlayerInfo.insert("Username",usernames.value(0));
    PlayerInfo.insert("Character",this->playerCharacters.value(0));
    PlayerInfo.insert("Position",1);
    QString card;
    //Use the encryption function to receive a QString of the encrypted card
    card = Sencryptcard(0,cards.at(0));
    PlayerInfo.insert("Card1",card);
    card = Sencryptcard(0,cards.value(1));
    PlayerInfo.insert("Card2",cards.at(1));
    card = Sencryptcard(0,cards.at(2));
    PlayerInfo.insert("Card3",card);
    PIArray.append(PlayerInfo);
    PlayerInfo = QJsonObject();
    qDebug() << "VAGINAS HAVE BALLS";

    //PlayerInfo for Player 2
    PlayerInfo.insert("Username",usernames.value(1));
    PlayerInfo.insert("Character",this->playerCharacters.value(1));
    PlayerInfo.insert("Position",1);
    //Use the encryption function to receive a QString of the encrypted card
    card = Sencryptcard(1,cards.at(3));
    PlayerInfo.insert("Card1",card);
    card = Sencryptcard(1,cards.at(4));
    PlayerInfo.insert("Card2",card);
    card = Sencryptcard(1,cards.at(5));
    PlayerInfo.insert("Card3",card);
    PIArray.append(PlayerInfo);
    PlayerInfo = QJsonObject();

    //PlayerInfo for Player 3
    PlayerInfo.insert("Username",usernames.value(2));
    PlayerInfo.insert("Character",this->playerCharacters.value(2));
    PlayerInfo.insert("Position",1);
    //Use the encryption function to receive a QString of the encrypted card
    card = Sencryptcard(2,cards.at(6));
    PlayerInfo.insert("Card1",card);
    card = Sencryptcard(2,cards.at(7));
    PlayerInfo.insert("Card2",card);
    card = Sencryptcard(2,cards.at(8));
    PlayerInfo.insert("Card3",card);
    PIArray.append(PlayerInfo);
    PlayerInfo = QJsonObject();

    //PlayerInfo for Player 4
    PlayerInfo.insert("Username",usernames.value(3));
    PlayerInfo.insert("Character",this->playerCharacters.value(3));
    PlayerInfo.insert("Position",1);
    //Use the encryption function to receive a QString of the encrypted card
    card = Sencryptcard(3,cards.at(9));
    PlayerInfo.insert("Card1",card);
    card = Sencryptcard(3,cards.at(10));
    PlayerInfo.insert("Card2",card);
    card = Sencryptcard(3,cards.at(11));
    PlayerInfo.insert("Card3",card);
    PIArray.append(PlayerInfo);
    PlayerInfo = QJsonObject();

    //PlayerInfo for Player 5
    PlayerInfo.insert("Username",usernames.value(4));
    PlayerInfo.insert("Character",this->playerCharacters.value(4));
    PlayerInfo.insert("Position",1);
    //Use the encryption function to receive a QString of the encrypted card
    card = Sencryptcard(4,cards.at(12));
    PlayerInfo.insert("Card1",card);
    card = Sencryptcard(4,cards.at(13));
    PlayerInfo.insert("Card2",card);
    card = Sencryptcard(4,cards.at(14));
    PlayerInfo.insert("Card3",card);
    PIArray.append(PlayerInfo);
    PlayerInfo = QJsonObject();

    //PlayerInfo for Player 6
    PlayerInfo.insert("Username",usernames.value(5));
    PlayerInfo.insert("Character",this->playerCharacters.value(5));
    PlayerInfo.insert("Position",1);
    //Use the encryption function to receive a QString of the encrypted card
    card = Sencryptcard(5,cards.at(15));
    PlayerInfo.insert("Card1",card);
    card = Sencryptcard(5,cards.at(16));
    PlayerInfo.insert("Card2",card);
    card = Sencryptcard(5,cards.at(17));
    PlayerInfo.insert("Card3",card);
    PIArray.append(PlayerInfo);

    msg.insert("PlayerInfo",PIArray);
    QString message = QJsonDocument(msg).toJson();
    this->myserver->writeMessage(-1,message);
}

void Communication::sendStartGame(){
    QJsonObject msg;
    msg.insert("Type",4);
    QString message = QJsonDocument(msg).toJson();
    this->myclient->write(message);
}

void Communication::processStartGame(int ID){
    qDebug() << "Received startgame";
    if (ID == this->superUserID){
        //Tell Game class to start the game
        emit startGame(this->ConnectedPlayers);
    }
}

void Communication::sendCharacterResponse(int Choice){
    QJsonObject msg;
    msg.insert("Type",6);
    msg.insert("Choice",Choice);
    QString message = QJsonDocument(msg).toJson();
    this->myclient->write(message);
}

void Communication::sendMoveRequest(int Roll, bool repeat,int PlayerID){
    QJsonObject msg;
    msg.insert("Type",8);
    msg.insert("ID",this->broadcastID);
    this->broadcastID = this->broadcastID + 1;
    msg.insert("PlayerID",PlayerID);
    msg.insert("DiceRoll",Roll);
    msg.insert("Repeat",repeat);
    QString message = QJsonDocument(msg).toJson();
    this->myserver->writeMessage(-1,message);
}

void Communication::sendMoveRespnse(int Location){
    QJsonObject msg;
    msg.insert("Type",9);
    msg.insert("Location",Location);
    QString message = QJsonDocument(msg).toJson();
    this->myclient->write(message);
}

void Communication::sendBoardState(int p1, int p2, int p3, int p4, int p5, int p6){
    QJsonObject msg;
    msg.insert("Type",10);
    msg.insert("ID",this->broadcastID);
    this->broadcastID = this->broadcastID + 1;
    msg.insert("Player1",p1);
    msg.insert("Player2",p2);
    msg.insert("Player3",p3);
    msg.insert("Player4",p4);
    msg.insert("Player5",p5);
    msg.insert("Player6",p6);
    QString message = QJsonDocument(msg).toJson();
    this->myserver->writeMessage(-1,message);

}

void Communication::sendAccusationRequest(int PlayerID){
    QJsonObject msg;
    msg.insert("Type",11);
    msg.insert("ID",this->broadcastID);
    this->broadcastID = this->broadcastID + 1;
    msg.insert("PlayerID",PlayerID);
    QString message = QJsonDocument(msg).toJson();
    this->myserver->writeMessage(-1,message);
}

void Communication::sendAccusationResponse(eCard Room, eCard Weapon, eCard Character){
    QJsonObject msg;
    msg.insert("Type",12);
    msg.insert("Room",eCard(Room));
    msg.insert("Weapon",eCard(Weapon));
    msg.insert("Character",eCard(Character));
    QString message = QJsonDocument(msg).toJson();
    this->myclient->write(message);
}

void Communication::sendShowRequest(int Accuser, int Responder, eCard Room, eCard Weapon, eCard Character){
    QJsonObject msg;
    msg.insert("Type",13);
    msg.insert("ID",this->broadcastID);
    this->broadcastID = this->broadcastID + 1;
    msg.insert("Accuser",Accuser);
    msg.insert("Responder",Responder);
    msg.insert("Room",eCard(Room));
    msg.insert("Weapon",eCard(Weapon));
    msg.insert("Character",eCard(Character));
    QString message = QJsonDocument(msg).toJson();
    this->myserver->writeMessage(-1,message);
}

void Communication::sendShowResponse(eCard Card){
    QJsonObject msg;
    msg.insert("Type",14);
    msg.insert("Card",eCard(Card));
    QString message = QJsonDocument(msg).toJson();
    this->myclient->write(message);
}

void Communication::sendShowBroadcast(int Responder, int Inquirer, eCard Card, eCard Room, eCard Weapon, eCard Character){
    QJsonObject msg;
    msg.insert("Type",15);
    msg.insert("ID",this->broadcastID);
    this->broadcastID = this->broadcastID + 1;
    msg.insert("Responder",Responder);
    msg.insert("Inquirer",Inquirer);
    QString encryptedCard = this->Sencryptcard(Inquirer,eCard(Card));
    msg.insert("Card",encryptedCard);
    msg.insert("Room",eCard(Room));
    msg.insert("Weapon",eCard(Weapon));
    msg.insert("Character",eCard(Character));
    QString message = QJsonDocument(msg).toJson();
    this->myserver->writeMessage(-1,message);
}

void Communication::sendDeclarationResult(int PlayerID, eCard Room, eCard Weapon, eCard Character, bool result){
    QJsonObject msg;
    msg.insert("Type",16);
    msg.insert("ID",this->broadcastID);
    this->broadcastID = this->broadcastID + 1;
    msg.insert("PlayerID",PlayerID);
    msg.insert("Room",eCard(Room));
    msg.insert("Weapon",eCard(Weapon));
    msg.insert("Character",eCard(Character));
    msg.insert("Result",result);
    QString message = QJsonDocument(msg).toJson();
    this->myserver->writeMessage(-1,message);
}

void Communication::sendDisconnecteNotify(int PlayerID){
    QJsonObject msg;
    msg.insert("Type",17);
    msg.insert("ID",this->broadcastID);
    this->broadcastID = this->broadcastID + 1;
    msg.insert("PlayerID",PlayerID);
    QString message = QJsonDocument(msg).toJson();
    this->myserver->writeMessage(-1,message);
}


void Communication::processSendInfo(QJsonObject msg)
{
    //Deconstruct message and send it to AI
}



void Communication::ProcessMessage(int playerID,QString MessageJSON)
{
    qDebug() << "Received a message.";
    QJsonDocument msg = QJsonDocument::fromJson(MessageJSON.toUtf8());
    if (!msg.isObject()) {
        qDebug() << "Invalid message received from" << playerID;
        qDebug() << MessageJSON;
        if (playerID != -1){
            myserver->writeMessage(-1,"What?");
        }
        return;
    }

    QJsonObject received = msg.object();

    if(!received.value("Type").isDouble()) {
        qDebug() << "Invalid Json message received.";
        return;
    }
    int Type = received.value("Type").toInt();
    switch (Type) {
    case 0: {   //Received by SERVER
        processACK(playerID,received.value("Acknowledgement").toBool());
        break;
    }
    case 1:{    //Received by SERVER
        this->processConnectRequest(playerID,received);
        break;
    }
    case 2:{    //Received by CLIENT
        //Tell GUI that request to server failed.
        emit connectFail(received.value("LobbyFull").toBool());
        break;
    }
    case 3:{    //Received by CLIENT
        sendACK(0);
        //Update GUI with new Player's count and if this client is the SuperUser
        qDebug() << "I received a lobby update";
        emit lobbyUpdate(received.value("Players").toInt(),received.value("SuperUser").toString());
        break;
    }
    case 4:{    //Received by SERVER
        this->processStartGame(playerID);
        break;
    }
    case 5:{    //Received by CLIENT
        sendACK(1);
        //GUI prompt user to select character
        emit selectCharacter(received.value("Username").toString(),
                             received.value("10").toBool(),received.value("11").toBool(),received.value("12").toBool(),
                             received.value("13").toBool(),received.value("14").toBool(),received.value("15").toBool());
        break;
    }
    case 6:{    //Received by SERVER
        //Assign this player a character
        this->playerCharacters[playerID] = received.value("Choice").toInt();
        break;
    }
    case 7:{    //Received by CLIENT
        sendACK(1);
        //This is a lot of information, throw it over to its own function:
        processPlayerInit(received);
        break;
    }
    case 8:{    //Received by CLIENT
        sendACK(1);
        //Inform GUI of diceroll and prompt for move
        emit moveRequest(received.value("DiceRoll").toInt(),received.value("PlayerID").toInt(),received.value("Repeat").toBool());
        break;
    }
    case 9:{    //Received by SERVER
        //Validate move
        //Update player's position
        emit moveResponse(received.value("Location").toInt());
        break;
    }
    case 10:{   //Received by CLIENT
        sendACK(1);
        //Update all the positions of players
        emit boardState(received.value("Player1").toInt(),received.value("Player2").toInt(),received.value("Player3").toInt(),
                        received.value("Player4").toInt(),received.value("Player5").toInt(),received.value("Player6").toInt());
        break;
    }
    case 11:{   //Received by CLIENT
        sendACK(1);
        //GUI prompt for Accusation
        emit guess();
        break;
    }
    case 12:{   //Received by SERVER
        //Record cards that are used for accusation
        //Send ShowRequest
        emit accusationResponse(playerID,received.value("Room").toInt(),received.value("Weapon").toInt(),received.value("Character").toInt());
        break;
    }
    case 13:{   //Received by CLIENT
        sendACK(1);
        //GUI either prompt to respond to request or just show the user the cards used in accusation
        if (received.value("Responder").toInt() == this->myID){
            emit showRequest(true,received.value("Accuser").toInt(),
                         eCard(received.value("Room").toInt()),eCard(received.value("Weapon").toInt()),
                         eCard(received.value("Character").toInt()));
        }
        else {
            emit showRequest(false,received.value("Accuser").toInt(),
                         eCard(received.value("Room").toInt()),eCard(received.value("Weapon").toInt()),
                         eCard(received.value("Character").toInt()));
        }
        break;
    }
    case 14:{   //Received by SERVER
        //Record card
        //Call ShowBroadcast
        emit showResponse(Sdecryptcard(playerID,received.value("Card").toString()));
        break;
    }
    case 15:{   //Received by CLIENT
        sendACK(1);
        //GUI show who accused and who responded
        if (this->myID == received.value("Inquirer").toInt()) {
            emit showBroadcast(true,received.value("Inquirer").toInt(),
                               this->Cdecryptcard(received.value("Card").toString()));
        }
        else {
            emit showBroadcast(false,received.value("Inquirer").toInt(),
                               received.value("Responder").toInt());
        }
        break;
    }
    case 16: {  //Received by CLIENT
        sendACK(1);
        //Inform GUI of cards used in declaration and of the result
        emit accusationResult(this->usernames.value(received.value("PlayerID").toInt()),received.value("Room").toInt(),received.value("Weapon").toInt(),
                              received.value("Character").toInt(),received.value("Result").toBool());
        break;
    }
    case 17:{   //Received by CLIENT
        sendACK(1);
        //Inform GUI that game will be paused for 10s
        emit dNotify(received.value("PlayerID").toInt());
        break;
    }
    case 18:{   //Received by CLIENT
        sendACK(1);
        //Too much information, will need its own function
        processSendInfo(received);
        break;
    }
    default:
        break;
    }
}

void Communication::clientConnected()
{
    this->sendConnectRequest();
}



Communication::Communication(QObject *parent,bool server,QString name) : QObject(parent){
    if (server == true){
        qDebug() << "This is the constructor for the Communication class made by a Server.";
        this->myserver = new Server(this,name);
        connect(myserver,SIGNAL(received(int,QString)),this,SLOT(ProcessMessage(int,QString)));
        this->myserver->StartServer();
    }
    else{
        qDebug() << "This is the constructor for the Communication class made by a Client.";
        this->myclient = new ClientC(this);
        connect(myclient,SIGNAL(received(int,QString)),this,SLOT(ProcessMessage(int,QString)));
        connect(myclient,SIGNAL(connected()),this,SLOT(clientConnected()));

        //Store password in QString
        myusername = name;


    }
}



int Communication::checkACKS()
{
    for(int a=0;a<6;a++){
        if(this->ACKS[a] == false){
            return a;
        }
    }
    return -1;
}
