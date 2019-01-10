#ifndef PLAYER_H
#define PLAYER_H

#include <QMap>
#include <QObject>
#include <String>
#include "Card.h"
#include "Communication.h"
#include "enums.h"

class Player : public QObject
{
    Q_OBJECT
private:
    bool Superuser = true;
    Player* me; //A pointer to the class itself
    QString Name; /**< The player's screen name */
    QString Password; //Player's password
    //int Position[6]; /**< The current location of all the players on the Board */
    QVector<int> myCards;
    QVector<int> guessCards;
    int myPosition = 1;
    Communication* comm; //Would make things easier to have a Communcation class in the Player class
    bool interactive = false;
    QVector<QString> characters;
    QString Character;
public:
    explicit Player(QObject *parent = 0);

    //When the user attempts to join a server this function will be called
    Q_INVOKABLE startClass(QString IP,QString Port);

    Q_INVOKABLE makeMove(int pos);

    //When the game opens, the user should insert a name and a password. This will be used to connect to the server
    Q_INVOKABLE setNamePassword(QString username, QString password);

    //After a player succesfully moves, he should be repositioned
    void setPostition(int pos);

    //If the player is SuperUser they have the control to start the game from the lobby
    Q_INVOKABLE startGame();

    //At the beginning of the game, the player can choose a character
    Q_INVOKABLE chooseCharacter(int character);

    //Send an accusation to the server using the AccusationResponse message
    Q_INVOKABLE guessResponse(int Suspect, int Weapon );

        /** \brief Make final Accusation
        *
        *	@param Cards a list of the 3 cards in your guess, any order.
        *	@see sendGuess(List<Card> Cards);
        */
    void Accusation(eCard theRoom, eCard theWeapon, eCard theSuspect);

        /** \brief Instansiate the local copy of all cards for this player.
        *
        * 	owners should be empty as this is unkown except for the server given cards.
        */
    void InitCards(eCard card1, eCard card2, eCard card3);

        /** \brief Move player to a location.
        *
        * 	Move to a location that will be evaluated for validity by the server after request.
        *	@param location The location that the client requested to move to.
        */
    void MoveTo(int location);

        /** \brief Pick a card to return as guess response.
        *
        *	@param theCard The guess response card that the player chose.
        *	@see Respond(Card theCard);
        */
    Q_INVOKABLE showCard(int theCard);
        /**
        * @brief Destructor should not be called on player disconnect.
        *
        * When a player disconnects, on the client side the player class may be distroyed, unless the client requests
        * an AI to take over on his behalf. The AI class should be instansiated from this class and therefore it should
        * be distroyed. When the player completely disconnects the Server uses its own instantiasion of the player class
        * to create an AI that could perform the required tasks.
        * @see AI();
        */

signals:
    void initCards(QString fcard,QString scard,QString tcard);
    void sconnectFail(QString message);
    void sboardState(QString player1,int pos1,QString player2,int pos2,QString player3,int pos3,QString player4,int pos4,QString player5,int pos5,QString player6,int pos6);
    void sguess();
    void slobbyUpdate(QString count,bool superuser);
    void sselectCharacter(bool Green, bool Peach, bool Peacock, bool Plum, bool Scarlet, bool White);
    void showRequestnot(QString character,QString card1,QString card2,QString card3);
    void showRequestfor(QString character,QString card1,QString card2,QString card3);
    void smoveRequest(QString message);
public slots:
    void lobbyUpdate(int Count,QString superuser);
    void selectCharacter(QString username,bool Green,bool Peach,bool Peacock,bool Plum,bool Scarlet,bool White);
    void showRequest(bool forme,int accuser,eCard room,eCard weapon,eCard Character);
    void showBroadcast(bool forme,int responder,int Card);
    void accusationResult(QString username,int Room,int Weapon,int Character,bool result);
    void init(eCard card1, eCard card2, eCard card3,QVector<int> characters);
    void connectFail(bool full);
    void moveRequest(int diceroll,int playerID,bool repeat);
    void boardState(int player1,int player2,int player3,int player4,int player5,int player6);
    void guess();
    void dNotify(int PlayerID);
};

#endif // PLAYER_H
