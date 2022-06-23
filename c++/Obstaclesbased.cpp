#include "Obstaclesbased.h"
Obstaclesbased::Obstaclesbased(QObject *parent): QObject(parent),o_x(0),o_y(0),isdeadly(false),isare(false)
{}
Obstaclesbased::~Obstaclesbased(){}

bool Obstaclesbased::deadly(){
    return isdeadly;
}

bool Obstaclesbased::are(){
    return isare;
}

int Obstaclesbased::x(){
    return o_x;
}

int Obstaclesbased::y(){
    return o_y;
}

void Obstaclesbased::setdeadly(const bool b){
    isdeadly=b;
}

void Obstaclesbased::setare(const bool b){
    isare=b;
}

void Obstaclesbased::setx(const int a){
    o_x+=a;
}

void Obstaclesbased::sety(const int a){
    o_y+=a;
}

