// gcc -Wall -Wextra -std=c99 ej4.c -o cuatroej

#include <stdio.h>

int main (void) {
    int x, y, temp;

    printf("Ingrese valor de x:\n");
    scanf("%d", &x);

    printf("Ingrese valor de y:\n");
    scanf("%d", &y);

    temp = y + y;
    x = x + y;
    y = temp;

    printf("Asignacion multiple. Valores de x e y: %d, %d\n", x,y);

}