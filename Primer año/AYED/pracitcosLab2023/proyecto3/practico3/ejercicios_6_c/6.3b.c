// gcc -Wall -Wextra -std=c99 6.3b.c -o seisejtresb

#include <stdio.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese el valor de %c\n", name);
    scanf("%d", &x);
    return x;
}

void imprimir_entero(int x){
    printf("%d\n", x);
}

int main(void) {
    int x, y;

    x = pedir_entero('x');
    y =  pedir_entero('y');

    x = (x + y);
    y = (y + y);

    imprimir_entero(x);
    imprimir_entero(y);

    return 0;
}

/*
Evalue con los mismos numeros del ejercicio original para verificar que funcione

Ingrese el valor de x
5
Ingrese el valor de y
4
9
8

Ingrese el valor de x
10
Ingrese el valor de y
25
35
50

Ingrese el valor de x
78
Ingrese el valor de y
140
218
280
*/