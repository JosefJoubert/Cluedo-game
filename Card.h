#ifndef Card_H
#define Card_H
#include <QString>
#include <QDebug>
#include "enums.h"



/**
* @brief an Enum used to filter out card types.
*
* Each different card chatagory has its own value, this is to assess that no player asks 3 rooms or 3 charachters in one accuse.
*/

class Player;


/**
* @brief The class that is used to represent all physical objects
*
* This class should have an overloaded operator for equals to determine if two cards are the same in when an accusation is made.
* Every player has his own instansiation of every card within the game.
*/
class Card{

private:
    int value;
    Player *owner;
	
public:
    //Overloaded constructor with all values
    Card(int cardValue, Player *owner);
    //Overloaded constructor with only cardvalue
    Card(int cardValue);
    ClueType getType();
	

    //Overloading some operators for functionality
	bool operator ==(const Card& c);
    void operator =(const Card &c);
    //Returns name of the card for GUI use
    QString getName();

    void setValue(int newValue);

    eCard getValue();

    void setOwner(Player* newOwner);

    Player* getOwner();
    //The main use of the Card class will be for the GUI, and since it only shows images, it will be necessary to
    //easily get the filename while only passing an eCard
    static QString getFileName(eCard card);
    static QString getCharacter(int ch);
	
	~Card();
};
#endif
