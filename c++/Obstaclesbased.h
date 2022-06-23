#ifndef OBSTACLESBASED_H
#define OBSTACLESBASED_H
#include <QObject>
#include <QQmlEngine>
//基础障碍
class Obstaclesbased : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(bool deadly READ deadly WRITE setdeadly)
    Q_PROPERTY(bool are READ are WRITE setare)
    Q_PROPERTY(int x READ x WRITE setx)
    Q_PROPERTY(int y READ y WRITE sety)
public:
    Obstaclesbased(QObject *parent=nullptr);
    virtual ~Obstaclesbased();
    bool deadly();
    bool are();
    int x();
    int y();
    void setdeadly(const bool);
    void setare(const bool);
    void setx(const int);
    void sety(const int);
private:
    int o_x;//位置
    int o_y;
    bool isdeadly;//是否致命
    bool isare;//是否存在
};
#endif // OBSTACLESBASED_H
