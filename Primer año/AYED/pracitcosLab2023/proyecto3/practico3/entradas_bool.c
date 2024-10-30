// gcc -Wall -Wextra -std=c99 entradas_bool.c -o entradasbool

#include <stdbool.h>
#include <stdio.h>

bool pedir_booleano(void){
    int x;
    printf("Ingrese un valor booleano(0(false), 1(true)) para x: \n");
    scanf("%d", &x);

    if(x == 0){
        return false;
    } else if (x == 1) {
        return true;
    } else {
        printf("Valor invalido, se asumira Falso\n");
        return false;
    }
}

void imprimir_booleano(bool x){
    if(x){
        printf("Verdadero\n");
    } else {
        printf("Falso\n");
    }
}

int main(void){
    bool x = pedir_booleano();
    printf("El valor ingresado es: ");
    imprimir_booleano(x);
    return 0;
}

/*
Ingrese un valor booleano(0(false), 1(true)) para x: 
0
El valor ingresado es: Falso

Ingrese un valor booleano(0(false), 1(true)) para x: 
1
El valor ingresado es: Verdadero

*/