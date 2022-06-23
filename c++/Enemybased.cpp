#include "Enemybased.h"
Enemybased::Enemybased(QObject *parent): QObject(parent),e_x(0),e_y(0),islive(true)
{}
Enemybased::~Enemybased(){}

bool Enemybased::live(){
    return islive;
}

int Enemybased::x(){
    return e_x;
}

int Enemybased::y(){
    return e_y;
}

void Enemybased::setlive(const bool b){
    islive=b;
}
void Enemybased::setx(const int a){
    e_x+=a;
}
void Enemybased::sety(const int a){
    e_y+=a;
}


