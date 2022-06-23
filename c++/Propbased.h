#ifndef PROPBASED_H
#define PROPBASED_H
#include <QObject>
#include <QQmlEngine>
//基础道具
class Propbased : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(bool are READ are WRITE setare)
    Q_PROPERTY(int x READ x WRITE setx)
    Q_PROPERTY(int y READ y WRITE sety)

public:
    Propbased(QObject *parent=nullptr);
    virtual ~Propbased();
    bool are();
    int x();
    int y();
    void setare(const bool);
    void setx(const int);
    void sety(const int);
private:
    int p_x;//位置
    int p_y;
    bool isare;//是否存在
};

#endif // PROPBASED_H
