#ifndef ENEMYBASED_H
#define ENEMYBASED_H
#include <QObject>
#include <QQmlEngine>
//基础敌人
class Enemybased : public QObject
{
    Q_OBJECT
public:
    Enemybased();
    virtual ~Enemybased();
    void move(int,int);//移动
    int gety();
    void die();
private:
    int x;//位置
    int y;
    bool islive;//是否存活
};

#endif // ENEMYBASED_H
