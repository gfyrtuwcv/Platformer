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
    int coinnum = 0;

};

#endif // PLAY_H
