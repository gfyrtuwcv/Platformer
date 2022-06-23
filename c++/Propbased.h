#ifndef PROPBASED_H
#define PROPBASED_H
#include <QObject>
#include <QQmlEngine>
//基础道具
class Propbased : public QObject
{
    Q_OBJECT

public:
    Propbased();
    virtual ~Propbased();
    void move(int,int);//移动
    void disappear();//消失
private:
    int x;//位置
    int y;
    bool isare;//是否存在
};

#endif // PROPBASED_H
