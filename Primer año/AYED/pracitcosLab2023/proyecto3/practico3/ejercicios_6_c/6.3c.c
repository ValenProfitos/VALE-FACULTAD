// gcc -Wall -Wextra -std=c99 6.3c.c -o seisejtresc

#include <stdio.h>

int pedir_entero(char name){
    int x;
    printf("Ingresar el valor de %c\n", name);
    scanf("%d", &x);
    return x;
}

void imprimir_entero(int x){
    printf("%d\n", x);
}

int main(void) {
    int x, y;

    x = pedir_entero('x');
    y = pedir_entero('y');

    y = (y + y);
    x = (x + y);

    imprimir_entero(x);
    imprimir_entero(y);

    return 0;
}

/*
Evalue con los mismos numeros que en el ejercicio original para verificar que funcione

Ingresar el valor de x
5
Ingresar el valor de y
4
13
8

Ingresar el valor de x
6
Ingresar el valor de y
2
10
4

Ingresar el valor de x
19
Ingresar el valor de y
45
109
90
*/
