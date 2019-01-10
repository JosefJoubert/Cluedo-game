
#include "player.h"

Player::Player(QObject *parent){


}

Player::startClass(QString IP,QString Port)
{
    this->comm = new Communication(this,false,Name);
    connect(this->comm,SIGNAL(lobbyUpdate(int,QString)),this,SLOT(lobbyUpdate(int,QString)));
    connect(this->comm,SIGNAL(selectCharacter(QString,bool,bool,bool,bool,bool,bool)),
            this,SLOT(selectCharacter(QString,bool,bool,bool,bool,bool,bool)));
    connect(this->comm,SIGNAL(showRequest(bool,int,eCard,eCard,eCard)),this,SLOT(showRequest(bool,int,eCard,eCard,eCard)));
    connect(this->comm,SIGNAL(accusationResult(QString,int,int,int,bool)),this,SLOT(accusationResult(QString,int,int,int,bool)));
    connect(this->comm,SIGNAL(init(eCard,eCard,eCard,QVector<int>)),this,SLOT(init(eCard,eCard,eCard,QVector<int>)));
    connect(this->comm,SIGNAL(connectFail(bool)),this,SLOT(connectFail(bool)));
    connect(this->comm,SIGNAL(moveRequest(int,int,bool)),this,SLOT(moveRequest(int,int,bool)));
    connect(this->comm,SIGNAL(boardState(int,int,int,int,int,int)),this,SLOT(boardState(int,int,int,int,int,int)));
    connect(this->comm,SIGNAL(guess()),this,SLOT(guess()));
    comm->connectToServer(IP,Port);

    qDebug() << "Started Player class";

}

Player::makeMove(int pos){
    if (interactive == true){
        comm->sendMoveRespnse(pos);
        qDebug() << "move to " << pos;
        interactive = false;
    }
}

Player::setNamePassword(QString username, QString password){
    qDebug() << "Username is" << username << " password is" << password;
    this->Name = username;
    this->Password = password;
}

void Player::setPostition(int pos){
    this->myPosition = pos;
}

Player::startGame()
{
    if (this->Superuser == true){
        comm->sendStartGame();
    }
    else {
        qDebug() << "You are the SuperUser.";
    }
}

Player::chooseCharacter(int character){
    this->Character = Card::getCharacter(character);
    this->comm->sendCharacterResponse(eCard(character));
}

void Player::MoveTo(int location){
    comm->sendMoveRespnse(location);
}

Player::showCard(int theCard){
    comm->sendShowResponse(eCard(myCards.value(theCard)));
    qDebug() << "You chose card" << theCard << "Which is " << Card::getFileName(eCard(myCards.value(theCard)));
}

void Player::lobbyUpdate(int Count, QString superuser){

    if(superuser == this->Name){
        this->Superuser = true;
        emit slobbyUpdate(QString::number(Count),true);
    }
    else {
        this->Superuser = false;
        emit slobbyUpdate(QString::number(Count),false);
    }
    //Send information to GUI
}

void Player::selectCharacter(QString username, bool Green, bool Peach, bool Peacock, bool Plum, bool Scarlet, bool White)
{
    if(username == this->Name) {
        //GUI prompt to select character
        emit sselectCharacter(Green,Peach,Peacock,Plum,Scarlet,White);
    }
}

void Player::showRequest(bool forme,int accuser, eCard room, eCard weapon, eCard Character)
{
    if (forme == false) {
        //Tell GUI that a guess has been made, send info of person who made the request
        emit showRequestnot(characters.value(accuser),Card::getFileName(room),Card::getFileName(weapon),Card::getFileName(Character));
    }
    else{
        //Tell GUI a guess has been made, prompt for response
        QString c1 = "";
        QString c2 = "";
        QString c3 = "";

        if (myCards.contains(eCard(room))){
            c1 = Card::getFileName(room);
        }
        if (myCards.contains(eCard(weapon))){
            c2 = Card::getFileName(weapon);
        }
        if (myCards.contains(eCard(Character))){
            c3 = Card::getFileName(Character);
        }
        emit showRequestfor(characters.value(accuser),c1,c2,c3);
    }
}

void Player::showBroadcast(bool forme, int responder, int Card)
{
    if(forme == true){
        //GUI show card and who responded
    }
    else{
        //GUI show who responded
    }
}

void Player::accusationResult(QString username, int Room, int Weapon, int Character, bool result)
{
    //Inform GUI of the result and if game should be ended
}

void Player::init(eCard card1, eCard card2, eCard card3,QVector<int> characters)
{
    myCards.append(eCard(card1));
    myCards.append(eCard(card2));
    myCards.append(eCard(card3));
    QString fcard = Card::getFileName(card1);
    QString scard = Card::getFileName(card2);
    QString tcard = Card::getFileName(card3);
    emit initCards(fcard,scard,tcard);
    for (int a = 0;a<characters.length();a++){
        this->characters.append(Card::getCharacter(a));
    }
}

void Player::connectFail(bool full)
{
    QString message;
    if (full == true){
        message = "This server is full";
    }
    else {
        message = "Password or Username is incorrect";
    }
    emit sconnectFail(message);
}

void Player::moveRequest(int diceroll, int playerID, bool repeat)
{
    QString message;
    if (Card::getCharacter(playerID) == this->Character){
        message = "It's your turn! Diceroll: " + diceroll;
        interactive = true;
    }
    else {
        message = characters.value(playerID) + " has a diceroll of: " + diceroll;
    }
}

void Player::boardState(int player1, int player2, int player3, int player4, int player5, int player6){
    emit sboardState(characters.value(player1),player1,characters.value(player2),player2,characters.value(player3),player3
                    ,characters.value(player4),player4,characters.value(player5),player5,characters.value(player6),player6);
}

void Player::guess()
{
    qDebug() << "Hello";
    emit sguess();
}

void Player::dNotify(int PlayerID)
{

}



void Player::Accusation(eCard theRoom, eCard theWeapon, eCard theSuspect){
    //Must check if player is in cellar i.e. room 0
    if (this->myPosition == 0) {
        this->comm->sendAccusationResponse(theRoom,theWeapon,theSuspect);
    }
    else {
        qDebug() << "Cannot make declaration if not in cellar";
    }
}

Player::guessResponse(int Suspect, int Weapon){
    qDebug() << "Response:" << Suspect << Weapon;
    this->comm->sendAccusationResponse(eCard(this->myPosition),eCard(Weapon),eCard(Suspect));
}
