#ifndef OBSTACLESBASED_H
#define OBSTACLESBASED_H
#include <QObject>
#include <QQmlEngine>
//基础障碍
class Obstaclesbased : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    Obstaclesbased();
    virtual ~Obstaclesbased();
    void move(int,int);//改变位置
    bool isdeadly();
private:
    int x;//位置
    int y;
    bool ischang;//是否改变位置
    bool deadly;//是否致命
    bool isare;//是否存在
};
#endif // OBSTACLESBASED_H
