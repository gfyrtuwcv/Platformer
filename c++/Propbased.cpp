#include "Propbased.h"

Propbased::Propbased():x(0),y(0),isare(true)
{}
Propbased::~Propbased(){}

void Propbased::move(int a, int b){
    x+=a;
    y+=b;
}
void Propbased::disappear(){
    isare=false;
}
