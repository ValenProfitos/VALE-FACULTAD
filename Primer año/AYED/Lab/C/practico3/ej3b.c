// gcc -Wall -Wextra -std=c99 ej3b.c -o tresbej

#include <stdio.h>

int main(void){
    int x, y;

    printf("Ingrese valor para x:\n");
    scanf("%d", &x);

    printf("Ingrese valor para y:\n");
    scanf("%d", &y);

    printf("Valores iniciales de x e y: %d, %d\n", x, y);

    x = x + y;

    printf("Hacemos la operacion: x = x + y\n");
    printf("x ahora vale: %d\n", x);

    y = y + y;

    printf("Hacemos la operacion: y = y + y\n");
    printf("y ahora vale: %d\n", y);

    printf("Valores finales de x e y: %d, %d\n", x, y);
}