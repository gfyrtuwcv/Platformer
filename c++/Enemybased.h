#ifndef ENEMYBASED_H
#define ENEMYBASED_H
#include <QObject>
#include <QQmlEngine>
//基础敌人
class Enemybased : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(bool live READ live WRITE setlive)
    Q_PROPERTY(int x READ x WRITE setx)
    Q_PROPERTY(int y READ y WRITE sety)
public:
    Enemybased(QObject *parent=nullptr);
    virtual ~Enemybased();
    bool live();
    int x();
    int y();
    void setlive(const bool);
    void setx(const int);
    void sety(const int);
private:
    int e_x;//位置
    int e_y;
    bool islive;//是否存活
};

#endif // ENEMYBASED_H
