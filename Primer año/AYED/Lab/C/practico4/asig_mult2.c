// gcc -Wall -Wextra -std=c99 asig_mult2.c -o asigmultdos

/*
PRE: x = X, y = Y, z = Z
x = y
y = y + x + z
z = y + x
POST: x = Y, y = Y + X + Z, z = Y + X
*/

#include <stdio.h>
#include <assert.h>

int pedir_entero(char name);

int main(void){
    int x, y, z, X, Y, Z, tempX,tempY;

    X = pedir_entero('X'); 
    Y = pedir_entero('Y');
    Z = pedir_entero('Z');

    // PRE: x = X, y = Y, z = Z

    x = X;
    y = Y;
    z = Z;

    tempX = X;
    tempY = Y;
    x = tempY;
    y = tempY + tempX + z;
    z = tempY + tempX;

    // POST: x = Y, y = Y + X + Z, z = Y + X

    printf("x = %d, y = %d, z = %d\n", x, y, z);

    assert(x == Y);
    assert(y == Y + X + Z);
    assert(z == Y + X);

    return 0;
}

int pedir_entero(char name){
    int x;
    printf("Ingrese valor para %c: \n", name);
    scanf("%d", &x);
    return x;
}