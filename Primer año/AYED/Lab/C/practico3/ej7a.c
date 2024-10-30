// gcc -Wall -Wextra -std=c99 ej7a.c -o sieteaej

#include <stdio.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese un valor para %c: \n", name);
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
        printf("Estado que ingresa en el bucle: \n");
        imprimir_entero('i', i);
        i = i -1;
        printf("Estado que sale luego del bucle: \n");
        imprimir_entero('i', i);
    }

    printf("Estado final: \n");
    imprimir_entero('i', i);
    
    return 0;
}