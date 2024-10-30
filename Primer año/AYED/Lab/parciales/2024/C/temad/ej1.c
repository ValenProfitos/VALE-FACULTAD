// gcc -Wall -Wextra -std=c99 ej1.c -o ej1

#include <stdio.h>
#include <assert.h>

int pedir_entero(char name);

int main(void){
    int x, y, z, X, Y, Z, tempX, tempY;

    X = pedir_entero('X');
    Y = pedir_entero('Y'); 
    Z = pedir_entero('Z'); 

    x = X;
    y = Y;
    z = Z;

    assert(x == X && y == Y && z == Z && X > 0 && Y > 0 && Z > 0);

    printf("Valores iniciales: x = %d, y = %d, z = %d\n", x, y, z);

    tempX = x;
    tempY = y;
    x = y;
    y = tempX + tempY - z;
    z = tempX*(1 + tempY * tempY);

    assert(x == Y && y == X + Y - Z && z == X * (1 + Y*Y));

    printf("Valores finales: x = %d, y = %d, z = %d\n", x, y, z);
}

int pedir_entero(char name){
    int x;
    printf("Ingrese valor para %c: ", name);
    scanf("%d", &x);
    return x;
}