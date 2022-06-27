#include "play.h"

Play::Play(QObject *parent):QObject(parent),coinnum(0)
{

}
int Play::coin(){
    return coinnum;
}
void Play::setCoin(int a){
    coinnum=a;
}
