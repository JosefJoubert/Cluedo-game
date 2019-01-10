#include "game.h"

Game::Game(QObject *parent) : QObject(parent){


}

Game::startServer(QString servername){
    qDebug() << "Starting server...";
    this->comm = new Communication(this,true,servername);
    connect(this->comm,SIGNAL(startGame(int)),this,SLOT(startGame(int)));
    connect(this->comm,SIGNAL(moveResponse(int)),this,SLOT(moveResponse(int)));
    connect(this->comm,SIGNAL(accusationResponse(int,int,int,int)),this,SLOT(accusationResponse(int,int,int,int)));
    connect(this->comm,SIGNAL(showResponse(int)),this,SLOT(showResponse(int)));
    connect(this->comm,SIGNAL(clientConnected(QString)),this,SLOT(connectedClient(QString)));
    emit serverIP(comm->getIP());
}

void Game::startGame(int connectedPlayers){
    for (int a = connectedPlayers; a < 6;a++){
        QString newname = "AI" + QString::number(a-connectedPlayers + 1);
        Communication* AIcomm = new Communication(this,false,newname);
        AI* newAI = new AI(0,AIcomm,newname);
        connect(AIcomm,SIGNAL(init(eCard,eCard,eCard,QVector<int>)),newAI,SLOT(initCards(eCard,eCard,eCard,QVector<int>)));
        this->AIs.append(AIcomm);
        QThread::msleep(100);

    }
    //constructInit();
}

void Game::moveResponse(int position)
{
    if (distance[diceroll][position] < position){
        positions[turn] = position;
        comm->sendBoardState(positions[0],positions[1],positions[2],positions[3],positions[4],positions[5]);
        if (position < 10){
            comm->sendAccusationRequest(turn);
        }
        else{
            nextTurn();
            waitForAcks(1);
        }
    }
}

void Game::accusationResponse(int accuser,int card1, int card2, int card3){
    this->accuser = accuser;
    this->card1 = card1;
    this->card2 = card2;
    this->card3 = card3;
    for (int a = 0; a < 6;a++){
        if (playercards.value(a).contains(card1)){
            if (a != accuser){
                comm->sendShowRequest(accuser,a,eCard(card1),eCard(card2),eCard(card3));
                responder = a;
                return;
            }
        }
        if (playercards.value(a).contains(card2)){
            if (a != accuser){
                comm->sendShowRequest(accuser,a,eCard(card1),eCard(card2),eCard(card3));
                responder = a;
                return;
            }
        }
        if (playercards.value(a).contains(card3)){
            if (a != accuser){
                comm->sendShowRequest(accuser,a,eCard(card1),eCard(card2),eCard(card3));
                responder = a;
                return;
            }
        }
    }
    nextTurn();
    moveRequest();
}

void Game::showResponse(int Card)
{
    comm->sendShowBroadcast(this->responder,this->accuser,eCard(Card),eCard(card1),eCard(card2),eCard(card3));
    nextTurn();
    moveRequest();
}

void Game::connectedClient(QString username)
{
    this->clientConnected(username);
}

void Game::constructInit()
{
    srand(time(NULL));
    auto engine = std::default_random_engine{};
    std::vector<int> initialVector = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21};
    std::shuffle(std::begin(initialVector),std::end(initialVector),engine);
    QVector<int> arr = QVector<int>::fromStdVector(initialVector);
    this->PRIZEROOM = rand() % 9 + 1;
    this->PRIZEWEAPON = rand() % 6 + 16;
    this->PRIZESUSPECT = rand() % 6 + 10;
    arr.remove(arr.indexOf(PRIZEROOM));
    arr.remove(arr.indexOf(PRIZEWEAPON));
    arr.remove(arr.indexOf(PRIZESUSPECT));

    //Record cards for each player
    QVector<int> temp;
    temp.append(arr.at(0));
    temp.append(arr.at(1));
    temp.append(arr.at(2));
    playercards.append(temp);
    temp.clear();
    temp.append(arr.at(3));
    temp.append(arr.at(4));
    temp.append(arr.at(5));
    playercards.append(temp);
    temp.clear();
    temp.append(arr.at(6));
    temp.append(arr.at(7));
    temp.append(arr.at(8));
    playercards.append(temp);
    temp.clear();
    temp.append(arr.at(9));
    temp.append(arr.at(10));
    temp.append(arr.at(11));
    playercards.append(temp);
    temp.clear();
    temp.append(arr.at(12));
    temp.append(arr.at(13));
    temp.append(arr.at(14));
    playercards.append(temp);
    temp.clear();
    temp.append(arr.at(15));
    temp.append(arr.at(16));
    temp.append(arr.at(17));
    playercards.append(temp);

    this->comm->sendPlayerInit(arr);
    //waitForAcks(1);
}

void Game::waitForAcks(int next){
    QThread::msleep(1000);
    if (comm->checkACKS() != -1){
        qDebug() << "A client as disconnected.";
        return;
    }
    switch(next) {
    case 1:{
        moveRequest();
    }
    }
}

void Game::moveRequest()
{
    int dice = qrand() % 6 +1;
    diceroll = dice;
    comm->sendMoveRequest(diceroll,false,this->turn);
}

void Game::nextTurn()
{
    if (turn == 5){
        turn = 0;
    }
    else {
        turn++;
    }
}
