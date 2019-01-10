#include "Card.h"
#include <iostream>

Card::Card(int cardValue, Player *owner)
{
    this->owner = owner;
    this->value = cardValue;

}

ClueType Card::getType()
{
    if (this->value == 0) {
        //Card has no value, card has no type
        return Null;
    }
    else if (this->value <= 9){
        return Room;
    }
    else if (this->value <= 15){
        return Suspect;
    }
    else{
        return Weapon;
    }
}

bool Card::operator ==(const Card &c)
{
    if (c.value == this->value){
        return true;
    }
    else{
        return false;
    }
}

void Card::operator =(const Card &c){
    this->value = c.value;
    this->owner = c.owner;
}

QString Card::getName(){

    switch(this->value){
        case (0):
            return  "None";
        case (1):
            return  "Courtyard";
        case (2):
            return  "Games Room";
        case (3):
            return  "Study";
        case (4):
            return  "Dining Room";
        case (5):
            return  "Garage";
        case (6):
            return  "Living Room";
        case (7):
            return  "Kitchen";
        case (8):
            return  "Bedroom";
        case (9):
            return  "Bathroom";
        case (10):
            return  "Green";
        case (11):
            return  "Mustard";
        case (12):
            return  "Peacock";
        case (13):
            return  "Plum";
        case (14):
            return  "Scarlet";
        case (15):
            return  "White";
        case (16):
            return  "Rope";
        case (17):
            return  "Dagger";
        case (18):
            return  "Wrench";
        case (19):
            return  "Pistol";
        case (20):
            return  "Candlestick";
        case (21):
            return  "Pipe";
    }
}

void Card::setValue(int newValue){
    this->value = newValue;
}

eCard Card::getValue(){
    return eCard(this->value);
}

void Card::setOwner(Player *newOwner){
    this->owner = newOwner;
}

QString Card::getFileName(eCard card){
    int i = eCard(card);
    switch(i){
    case (0):
        return "";
    case (1):
        return "Images/hall.jpg";
    case (2):
        return "Images/billiard.jpg";
    case (3):
        return "Images/study.jpg";
    case (4):
        return "Images/dining.jpg";
    case (5):
        return "Images/garage.jpg";
    case (6):
        return "Images/lounge.jpg";
    case (7):
        return "Images/kitchen.jpg";
    case (8):
        return "Images/bedroom.jpg";
    case (9):
        return "Images/bathroom.jpg";
    case (10):
        return "Images/green.jpg";
    case (11):
        return "Images/peach.jpg";
    case (12):
        return "Images/peacock.jpg";
    case (13):
        return "Images/plum.jpg";
    case (14):
        return "Images/scarlet.jpg";
    case (15):
        return "Images/white.jpg";
    case (16):
        return "Images/rope.jpg";
    case (17):
        return "Images/revolver.jpg";
    case (18):
        return "Images/axe.jpg";
    case (19):
        return "Images/poison.jpg";
    case (20):
        return "Images/candlestick.jpg";
    case (21):
        return "Images/syringe.jpg";
    }
}

QString Card::getCharacter(int ch)
{
    switch(ch){
    case (10):
        return "Green";
    case (11):
        return "Peach";
    case (12):
        return "Peacock";
    case (13):
        return "Plum";
    case (14):
        return "Scarlet";
    case (15):
        return "White";
    }
}

