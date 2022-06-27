#ifndef PLAY_H
#define PLAY_H
#include <QObject>
#include <QQmlEngine>
class play : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
public:
    play(QObject *parent=nullptr);
    Q_INVOKABLE void hello();
private:

};

#endif // PLAY_H
