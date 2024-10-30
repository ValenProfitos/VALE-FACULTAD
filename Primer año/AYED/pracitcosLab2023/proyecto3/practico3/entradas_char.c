// gcc -Wall -Wextra -std=c99 entradas_char.c -o entradaschar

#include <stdio.h>

int x;

int pedir_entero(char name){
    printf("Ingrese un valor para %c: \n", name);
    scanf("%d", &x);
    return x;
}

void imprimir_entero(char name, int x){
    printf("%c = %d\n", name, x);
}

int main(void){
    char nombre_variable = 'n';
    pedir_entero(nombre_variable);
    imprimir_entero(nombre_variable, x);
    return 0;
}

/*
Ingrese un valor para n: 
6
n = 6

*/