// gcc -Wall -Wextra -std=c99 asig_mult1.c -o asigmultuno

#include <stdio.h>
#include <assert.h>

/*
Pre: x = X, y = Y
x = x + 1
y = x + y
Post: x = X + 1, y = X + Y
*/

int pedir_entero(char name);

int main(void){
    int x, y, X, Y;

    // Pre: x = X, y = Y

    X = pedir_entero('X');
    Y = pedir_entero('Y');

    x = X;
    y = Y;

    y = x + y;
    x = x + 1;

    // Post: x = X + 1, y = X + Y

    assert(x == X + 1);
    assert(y = X + Y);

    printf("x = %d, y = %d\n", x, y);

    return 0;
}

int pedir_entero(char name){
    int x;
    printf("Ingrese valor para %c:\n", name);
    scanf("%d", &x);
    return x;
}