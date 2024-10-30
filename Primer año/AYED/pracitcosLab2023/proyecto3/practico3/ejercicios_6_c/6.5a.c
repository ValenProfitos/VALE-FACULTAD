// gcc -Wall -Wextra -std=c99 6.5a.c -o seisejcincoa

#include <stdio.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese el valor de %c\n", name);
    scanf("%d", &x);
    return x;
}

void imprimir_entero(int x){
    printf("%d\n", x);
}

int main(void){
    int i;

    i = pedir_entero('i');

    while (i != 0)
    {
        imprimir_entero(i);
        i = i - 1;
    }

    return 0;
    
}

/*
Evalue con i = 4

Ingrese el valor de i
4
4
3
2
1

*/