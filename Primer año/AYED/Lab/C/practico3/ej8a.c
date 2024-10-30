// gcc -Wall -Wextra -std=c99 ej8a.c -o ochoaej

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

int main(void){
    int i, x, y;

    x = pedir_entero('x');
    y = pedir_entero('y');
    i = pedir_entero('i');

    i = 0;

    while (x >= y)
    {
        printf("Estado que ingresa al bucle: \n");
        imprimir_entero('x', x);
        imprimir_entero('y', y);
        imprimir_entero('i',i);
        x = x - y;
        i = i + 1;
        printf("Estado luego del bucle: \n");
        imprimir_entero('x', x);
        imprimir_entero('y', y);
        imprimir_entero('i',i);
    }
    
    printf("Estado final: \n");
    imprimir_entero('x', x);
    imprimir_entero('y', y);
    imprimir_entero('i',i);

    return 0;    
}