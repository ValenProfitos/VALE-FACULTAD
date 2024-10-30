// gcc -Wall -Wextra -std=c99 entradas.c -o entradas

#include <stdio.h>

int x;

int pedir_entero(void){
    printf("Ingrese un valor para x: \n");
    scanf("%d", &x);
    return x;
}

void imprimir_entero(int x){
    printf("%d\n", x);
}

int main(void){
    pedir_entero();
    imprimir_entero(x);
    return 0;
}

/*
Ingrese un valor para x: 
5
5

*/