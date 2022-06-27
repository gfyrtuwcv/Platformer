#include "play.h"

play::play(QObject *parent=nullptr):QObject(parent)
{

}
void play::hello(){
    qDebug<<"hello";
}
