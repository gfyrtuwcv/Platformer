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
    Playerbased();
    virtual ~Playerbased();
    void left(int);//移动
    void right(int);
    void down(int);
    void up(int);
    void sizechang(int);//改变大小
private:
    int x;//位置
    int y;
    int size;//大小
    bool islive;//是否存活

};

#endif // PLAYERBASED_H
