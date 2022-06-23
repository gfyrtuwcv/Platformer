#include "Playerbased.h"
Playerbased::Playerbased(QObject *parent): QObject(parent),p_x(0),p_y(0),bigsize(1),islive(true)
{}
Playerbased::~Playerbased(){}

bool Playerbased::live(){
    return islive;
}

int Playerbased::size(){
    return bigsize;
}

int Playerbased::x(){
    return p_x;
}

int Playerbased::y(){
    return p_y;
}

void Playerbased::setlive(const bool b){
    islive=b;
}

void Playerbased::setsize(const int a){
    bigsize+=a;
}

void Playerbased::setx(const int a){
    p_x+=a;
}

void Playerbased::sety(const int a){
    p_y+=a;
}


/*void Playerbased::left(int a){
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
*/
void Playerbased::sizechang(int a){
    bigsize+=a;
    if(bigsize>3) bigsize=3;
    if(bigsize<1) emit death();//玩家死亡
}

void Playerbased::resultsObstacl(Obstaclesbased ob){
    if(ob.deadly()) sizechang(-1);
}

void Playerbased::resultsEnemy(Enemybased en){
    if(p_y<en.y()){
        en.setlive(false);
    }else sizechang(-1);
}

void Playerbased::disappear(Propbased pr){
    pr.setare(false);
}

void Playerbased::die(){
    islive=false;
}




