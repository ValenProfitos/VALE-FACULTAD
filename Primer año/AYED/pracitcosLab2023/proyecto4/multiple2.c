// gcc -Wall -Wextra -std=c99 -g multiple2.c -o multiple2

/*
Pre: x = X, y = Y, z = Z
temp = y;
y = y + x + z;
x = temp;
z = y + x;
Post: x = Y, y = Y + X + Z, z = Y + X;
*/

#include <stdio.h>
#include <assert.h>

int pedir_entero(char name);

int main(){
    int x, y, z, X, Y, Z;

    X = pedir_entero('X');
    Y = pedir_entero('Y');
    Z = pedir_entero('Z');

    //Pre: x = X, y = Y, z = Z
    
    x = X;
    y = Y;
    z = Z;

    int temp = y;
    y = y + x + z;
    x = temp;
    z = Y + X;

    //Post: x = Y, y = Y + X + Z, z = Y + X

    assert(x == Y);
    assert(y = Y + X + Z);
    assert(z == Y + X);

    printf("x = %d, y = %d, z = %d\n", x, y, z);

    return 0;
}

int pedir_entero(char name){
    int x;
    printf("Ingrese valor para %c:\n", name);
    scanf("%d", &x);
    return x;
}