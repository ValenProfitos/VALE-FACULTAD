// gcc -Wall -Wextra -std=c99 ej7b.c -o sietebej

#include <stdio.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese el valor de %c\n", name);
    scanf("%d", &x);
    return x;
}

void imprimir_entero(char name, int x){
    printf("%c = %d\n", name, x);
}

int main(void){
    int i;

    i = pedir_entero('i');

    while (i != 0)
    {
        printf("Estado que ingresa al bucle: \n");
        imprimir_entero('i', i);
        i = 0;
        printf("Estado luego del bucle: \n");
        imprimir_entero('i', i);
    }
    
    printf("Estado final: \n");
    imprimir_entero('i', i);
    return 0;
}