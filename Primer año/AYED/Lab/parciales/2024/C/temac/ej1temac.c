// gcc -Wall -Wextra -std=c99 ej1temac.c -o tc1

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

    // PRE: x = X, y = Y, z = Z, X > 0, Y > 0, Z > 0

    assert(x == X && y == Y && z == Z && X > 0 && Y > 0 && Z > 0);
    
    printf("Valores iniciales de x: %d, y: %d, z: %d\n", x, y, z);

    tempX = x;
    tempY = y;
    x = y + z;
    y = z * tempX;
    z = tempX / tempY;

    assert(x == Y + Z && y == Z * X && z == X / Y);

    printf("Valores finales de x: %d, y: %d, z: %d\n", x, y, z);
}

int pedir_entero(char name){
    int x;
    printf("Ingrese valor para %c: ", name);
    scanf("%d", &x);
    return x;
}