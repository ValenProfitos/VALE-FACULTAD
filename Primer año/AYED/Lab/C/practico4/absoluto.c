// gcc -Wall -Wextra -std=c99 absoluto.c -o vabsoluto

#include <stdio.h>
#include <assert.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese valor para %c: \n", name);
    scanf("%d", &x);
    return x;
}

int valor_absoluto(int x){
    // Pre: No se verifica el tipo de dato

    assert( x >= 0 || x < 0);

    if(x < 0){
        x = -x;
    }

    // Post: El valor absoluto es un numero positivo

    assert(x >= 0);

    return x;
}

int main(void){
    int x;

    x = pedir_entero('x');

    int abs = valor_absoluto(x);

    printf("El valor absoluto de %d es: %d\n", x, abs);

    return 0;
}