// gcc -Wall -Wextra -std=c99 ej3c.c -o trescej

#include <stdio.h>

int main(void){
    int x, y;

    printf("Ingrese valor para x:\n");
    scanf("%d", &x);

    printf("Ingrese valor para y:\n");
    scanf("%d", &y);

    printf("Valores iniciales de x e y: %d, %d\n", x, y);

    y = y + y;

    printf("Hacemos la operacion: y = y + y\n");
    printf("Valor actual de y: %d\n", y);

    x = x + y;

    printf("Hacemos la operacion: x = x + y\n");
    printf("Valor actual de x: %d\n", x);

    printf("Valores finales de x e y: %d, %d\n", x, y);

}