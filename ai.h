#ifndef AI_H
#define AI_H

#include <QObject>
#include "Communication.h"
#include <QVector>
#include <QString>
#include "enums.h"

class AI : public QObject
{
    Q_OBJECT
public:
    explicit AI(QObject *parent = 0,Communication *comm = 0,QString myname=0);

signals:

public slots:
    void initCards(eCard c1,eCard c2,eCard c3,QVector<int> characters);
    void selectQuestion();
    void updateData(bool forme,int responder, int number);//type 0=person; 1=weapon; 2=room
    void determineMove(int dice,QString name,bool repeat);
    void determineCardShow(bool forme, int accuser, eCard cp, eCard cw, eCard cr);
    void selectAccusation();
private:
    QString myname;
    int person[6];
    int weapon[6];
    int room[10];
    int position;
    int pNum;
    int wNum;
    int rNum;
    int distance[83][83];
    Communication* comm;

    void connectToServer();
};

#endif // AI_H
