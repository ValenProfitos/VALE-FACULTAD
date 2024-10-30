// gcc -Wall -Wextra -std=c99 6.5b.c -o seisejcincob

#include <stdio.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese el valor de %c\n", name);
    scanf("%d", &x);
    return x;
}

void imprimir_entero(int x, int y, int i){
    printf("Estados actuales de x = %d, y = %d, i = %d\n", x, y, i);
}

int main(void){
    int x, y, i;

    x = pedir_entero('x');
    y = pedir_entero('y');

    i = 0;

    while (x >= y)
    {
        imprimir_entero(x, y, i);

        x = (x - y);
        i = (i + 1);
    }

    imprimir_entero(x, y, i);
    return 0;
    
}

/*
Evalue con lo mismo que el ejercicio anterior para verificar que funcione

Ingrese el valor de x
13
Ingrese el valor de y
3
Estados actuales de x = 13, y = 3, i = 0
Estados actuales de x = 10, y = 3, i = 1
Estados actuales de x = 7, y = 3, i = 2
Estados actuales de x = 4, y = 3, i = 3
Estados actuales de x = 1, y = 3, i = 4
*/