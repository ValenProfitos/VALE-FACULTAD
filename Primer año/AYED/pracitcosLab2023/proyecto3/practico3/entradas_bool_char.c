// gcc -Wall -Wextra -std=c99 entradas_bool_char.c -o entradasboolchar

#include <stdbool.h>
#include <stdio.h>

bool pedir_booleano(char name){
    int x;
    printf("Ingrese un valor booleano(0(false), 1(true)) para %c: \n", name);
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

void imprimir_booleano(char name, bool x){
    printf("El valor de %c es: ", name);
    if(x){
        printf("Verdadero\n");
    } else {
        printf("Falso\n");
    }
}

int main(void){
    char nombre_variable = 'n';
    bool x = pedir_booleano(nombre_variable);
    imprimir_booleano(nombre_variable, x);
    return 0;
}

/*
Ingrese un valor booleano(0(false), 1(true)) para n: 
1
El valor de n es: Verdadero

Ingrese un valor booleano(0(false), 1(true)) para n: 
0
El valor de n es: Falso

*/