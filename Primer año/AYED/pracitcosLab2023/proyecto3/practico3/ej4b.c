// gcc -Wall -Wextra -std=c99 ej4b.c -o cuatroejb

#include <stdio.h>

int main(void){
    int x, y, z, m;

    printf("Ingrese el valor entero para x: \n");
    scanf("%d", &x);
    printf("Ingrese el valor entero para y: \n");
    scanf("%d", &y);
    printf("Ingrese el valor entero para z: \n");
    scanf("%d", &z);
    printf("Ingrese el valor entero para m: \n");
    scanf("%d", &m);

    if (x < y){
        m = x;
    } else if (x >= y) {
        m = y;
    }
    printf("Estado 1: %i, %i, %i, %i \n", x, y, z, m);
    if(m < z){} else {
        m = z;
    }
    printf("Estado final: %i, %i, %i, %i\n", x, y, z, m);

    return 0;
}

/*
Evalue con los enteros dados en el practico
x = 5, y = 4, z = 8, m = 0

Estado 1: 5, 4, 8, 4
Estado Final: 5 , 4, 8, 4

Evalue con x = 5, y = 12, z = 1, m = 69

Estado 1: 5, 12, 1, 5
Estado Final: 5, 12, 1, 1

Este programa cambia el valor de m segun las aclaraciones, si x es menor que y, m vale lo mismo que x, si x es mayor o igual a y, entonces m vale lo mismo que y. Luego, si m es menor a z, saltamos (o m se mantiene igual) y termina el programa, pero si m es mayor o igual a z, entonces m vale lo mismo que z.
Al final el valor de m va a terminar siendo igual a alguna de las otras variables.
*/