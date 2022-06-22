#include "Enemybased.h"

Enemybased::Enemybased():x(0),y(0),islive(true)
{}
Enemybased::~Enemybased(){}

void Enemybased::move(int a,int b){
    x+=a;
    y+=b;
}
void Enemybased::die(){
    islive=false;
}
int Enemybased::gety(){
    return y;
}
