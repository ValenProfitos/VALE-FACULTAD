// gcc -Wall -Wextra -std=c99 -g absoluto.c -o absoluto

#include <stdio.h>
#include <assert.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese el valor de %c \n", name);
    scanf("%d", &x);
    return x;
}

int valor_absoluto(int x){

    //Precondicion: No se verifica el tipo de dato
    assert(x >= 0 || x < 0);

    if (x < 0)
    {
        x = -x;
    }

    //Postcondicion: El valor absoluto es un numero negativo

    assert(x >= 0);

    return x;
    
}

int main(void){
    int x;

    x = pedir_entero('x');

    int absoluto = valor_absoluto(x);

    printf("El valor absoluto de %d es: %d\n", x, absoluto);

    return 0;
}

/*
Ingrese el valor de x 
9
El valor absoluto de 9 es: 9

Ingrese el valor de x 
-9
El valor absoluto de -9 es: 9

*/