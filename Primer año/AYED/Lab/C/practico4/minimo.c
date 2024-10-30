// gcc -Wall -Wextra -stc=c99 minimo.c -o minimo

#include <stdio.h>
#include <assert.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese valor para %c: \n", name);
    scanf("%d", &x);
    return x;
}

int minimo(int x, int y){
    // Pre: x e y son numeros enteros

    int res;

    if(x <= y){
        res = x;
    } else {
        res = y;
    }

    // Post: res contiene el valor minimo entre x e y

    assert((res == x && res <= y) || (res == y && res < x));

    return res;
}

int main(void){
    int x, y;

    x = pedir_entero('x');
    y = pedir_entero('y');

    int min = minimo(x, y);

    printf("El valor minimo entre x e y es: %d\n", min);

    return 0;
}