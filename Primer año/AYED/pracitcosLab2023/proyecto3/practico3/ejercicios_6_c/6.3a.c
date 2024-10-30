// gcc -Wall -Wextra -std=c99 6.3a.c -o seisejtresa

#include <stdio.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese valor para %c\n", name);
    scanf("%d", &x);
    return x;
}

void imprimir_entero(int x){
    printf("%d\n", x);
}

int main(void){
    int x;

    x = pedir_entero('x');
    x = 5;
    imprimir_entero(x);

    return 0;
}

/*
Funciona bien, cualquier numero que le de a x no importa porque me devuelve 5
*/