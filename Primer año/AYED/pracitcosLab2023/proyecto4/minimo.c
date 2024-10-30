// gcc -Wall -Wextra -std=c99 -g minimo.c -o minimo

#include <stdio.h>
#include <assert.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese valor para %c \n", name);
    scanf("%d", &x);
    return x;
}

int minimo(int x, int y){
    //Precondicion: x e y son numeros enteros
    assert(sizeof(x) == sizeof(int) && sizeof(y) == sizeof(int));

    int resultado;

    if(x < y){
        resultado = x;
    } else {
        resultado = y;
    }

    //Postcondicion: resultado contiene el valor minimo entre x e y

    assert((resultado == x && resultado <= y) || (resultado == y && resultado <= x));

    return resultado;
}

int main(void){
    int a, b;

    a = pedir_entero('a');
    b = pedir_entero('b');

    int min = minimo(a, b);

    printf("El valor minimo entre a y b es: %d\n", min);

    return 0;
}

/*
Ingrese valor para a 
7
Ingrese valor para b 
4
El valor minimo entre a y b es: 4
*/