// gcc -Wall -Wextra -std=c99 6.2.c -o seisejdos

#include <stdbool.h>
#include <stdio.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese valor entero para %c\n", name);
    scanf("%d", &x);
    return x;
}

void imprimir_entero(bool condicion){
    printf("%s\n", condicion ? "true" : "false");
}

int main(void){
    int x, y, z, b, w;
    bool condicion;

    x = pedir_entero('x');

    condicion = (x % 4 == 0);
    imprimir_entero(condicion);

    y = pedir_entero('y');
    z = pedir_entero('z');

    condicion = (x + y == 0 && y - x == -z);
    imprimir_entero(condicion);

    b = pedir_entero('b');
    w = pedir_entero('w');
    
    condicion = !b && w;
    imprimir_entero(condicion);

    return 0;
}