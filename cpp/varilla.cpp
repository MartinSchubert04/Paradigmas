#include <iostream>

/*

Mediante la aproximacion de la segunda derivada de una funcion planteando

dF(x) = Yi+1 - Yi / h

T[i,k+1] =  T[i,k] + α * (Δt/Δx^2) * (T[i+1, k] - 2T[i,k] + T[i-1, k])

donde i = nodo actual y k = instancia de tiempo actual

T = temperatura
t = tiempo
h = long entre nodos
α = constante de conductividad

*/

static int initialTemp = 100;
static int ambientTemp = 20;
static int conductivity = 1;

class Node {
public:
  float heat;
}


float calculateHeat(Node &node) {
  float T_new = ;
  return 0.0f;
}

int main() { return 0; }