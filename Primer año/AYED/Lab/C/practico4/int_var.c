// gcc -Wall -Wextra -std=c99 int_var.c -o intvar

#include <stdio.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese el valor de %c: \n", name);
    scanf("%d", &x);
    return x;
}

void imprimir_entero(char name, int x){
    printf("%c = %d\n", name, x);
}

void mostrar_estado(int x){
    printf("Estado %d: \n", x);
}

int main(void){
    int x, y, z;

    x = pedir_entero('x');
    y = pedir_entero('y');

    mostrar_estado(1);
    imprimir_entero('x', x);
    imprimir_entero('y', y);

    z = x;
    x = y;
    y = z;

    mostrar_estado(2);
    imprimir_entero('x', x);
    imprimir_entero('y', y);

    return 0;
}