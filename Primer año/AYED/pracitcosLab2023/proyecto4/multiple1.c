// gcc -Wall -Wextra -std=c99 -g multiple1.c -o multiple1

/*
Pre: x = X, y = Y
x = x + 1
y = x + y
Post: x = X + 1, y = X + Y
*/

#include <stdio.h>
#include <assert.h>

int pedir_entero(char name);

int main(){
    int x, y, X, Y;

    X = pedir_entero('X');
    Y = pedir_entero('Y');
    
    // Pre: x = X, y = Y

    x = X;
    y = Y;

    y = x + Y;
    x = x + 1;

    //Post: x = X + 1, y = X + Y

    assert(x == X + 1);
    assert(y == X + Y);

    printf("x = %d, y = %d\n", x, y);

    return 0;
}

int pedir_entero(char name){
    int x;
    printf("Ingrese valor para %c \n", name);
    scanf("%d", &x);
    return x;
}