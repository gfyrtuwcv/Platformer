#include "Playerbased.h"

Playerbased::Playerbased():x(0),y(0),size(1),islive(true)
{}
Playerbased::~Playerbased(){}

void Playerbased::left(int a){
    x-=a;
}
void Playerbased::right(int a){
    x+=a;
}
void Playerbased::down(int a){
    y+=a;
}
void Playerbased::up(int a){
    y-=a;
}

void Playerbased::sizechang(int a){
    size+=a;
    if(size>3) size=3;
    if(size<1) emit death();//玩家死亡
}

void Playerbased::resultsObstacl(Obstaclesbased ob){
    if(ob.isdeadly()) sizechang(-1);
}

void Playerbased::resultsEnemy(Enemybased en){
    if(y<en.gety()){
        en.die();
    }else sizechang(-1);
}

void Playerbased::disappear(Propbased pr){
    pr.disappear();
}

void Playerbased::die(){
    islive=false;
}




