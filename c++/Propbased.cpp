#include "Propbased.h"
Propbased::Propbased(QObject *parent): QObject(parent),p_x(0),p_y(0),isare(true)
{}
Propbased::~Propbased(){}

bool Propbased::are(){
    return isare;
}

int Propbased::x(){
    return p_x;
}

int Propbased::y(){
    return p_y;
}

void Propbased::setare(const bool b){
    isare=b;
}

void Propbased::setx(const int a){
    p_x+=a;
}

void Propbased::sety(const int a){
    p_y+=a;
}
