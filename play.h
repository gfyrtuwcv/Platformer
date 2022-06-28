#ifndef PLAY_H
#define PLAY_H
#include <QObject>
#include <QQmlEngine>
class Play : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
public:
    Play(QObject *parent=nullptr);
    Q_PROPERTY(int coin READ coin WRITE setCoin )
    //Q_INVOKABLE void hello();
    Q_INVOKABLE int coin();
    Q_INVOKABLE void setCoin(int);
private:
    int coinnum;
};

#endif // PLAY_H
