// gcc -Wall -Wextra -std=c99 6.5a1.c -o seisejcincoauno

#include <stdio.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese valor para %c\n", name);
    scanf("%d", &x);
    return x;
}

void imprimir_entero(char name, int x){
    printf("Estado de %c: %d\n", name, x);
}

int main(void){
    int i;

    i = pedir_entero('i');

    while (i != 0){
        imprimir_entero('i', i);
        i = 0;
    }

    imprimir_entero('i', i);

    return 0;
}

/*
Evalue con 4
Ingrese valor para i
4
Estado de i: 4
Estado de i: 0

*/