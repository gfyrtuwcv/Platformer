#include "Obstaclesbased.h"

Obstaclesbased::Obstaclesbased():x(0),y(0),ischang(false),deadly(false),isare(false)
{}
Obstaclesbased::~Obstaclesbased(){}

void Obstaclesbased::move(int a, int b){
    x+=a;
    y+=b;
}
bool Obstaclesbased::isdeadly(){
    return deadly;
}
