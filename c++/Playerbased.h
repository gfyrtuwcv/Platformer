#ifndef PLAYERBASED_H
#define PLAYERBASED_H
#include <QObject>
#include <QQmlEngine>
#include "Enemybased.h"
#include "Obstaclesbased.h"
#include "Propbased.h"
//玩家
class Playerbased : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(bool live READ live WRITE setlive)
    Q_PROPERTY(int size READ size WRITE setsize)
    Q_PROPERTY(int x READ x WRITE setx)
    Q_PROPERTY(int y READ y WRITE sety)
signals:
    void death();//玩家死亡
    void encounterObstacl();//碰到障碍
    void encounterEnemy();//碰到敌人
    void eat();//吃道具
public slots:
    void resultsObstacl(Obstaclesbased);//碰到障碍
    void resultsEnemy(Enemybased);//碰到敌人
    void disappear(Propbased);//道具消失
    void die();//玩家死亡
public:
    Playerbased(QObject *parent=nullptr);
    virtual ~Playerbased();
    bool live();
    int size();
    int x();
    int y();
    void setlive(const bool);
    void setsize(const int);
    void setx(const int);
    void sety(const int);

    void left(int);//移动
    void right(int);
    void down(int);
    void up(int);
    void sizechang(int);//改变大小

private:
    int p_x;//位置
    int p_y;
    int bigsize;//大小
    bool islive;//是否存活

};

#endif // PLAYERBASED_H
