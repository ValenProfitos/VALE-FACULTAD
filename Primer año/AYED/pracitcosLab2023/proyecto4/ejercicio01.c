// gcc -Wall -Wextra -std=c99 -g ejercicio01.c -o ejuno

#include <stdio.h>
#include <assert.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese un valor para %c \n", name);
    scanf("%d", &x);
    return x;
}

void hola_hasta(int n){

    while (n > 0)
    {
        printf("Hola\n");
        n = n - 1;
    }

}

int main(void){
    int n;

    n = pedir_entero('n');
    assert(n > 0);
    hola_hasta(n);
}

/*
Ingrese un valor para n 
5
Hola
Hola
Hola
Hola
Hola
*/