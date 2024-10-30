// gcc -Wall -Wextra -std=c99 ej4a.c -o cuatroeja

#include <stdio.h>

int main(void){
    int x, y;
    
    printf("Ingrese valor de x\n");
    scanf("%d", &x);
    printf("Ingrese valor de y\n");
    scanf("%d", &y);

    if(x >= y){
        x = 0;
    } else{
        x = 2;
    }
    printf("%d\n", x);
    return 0;
}

/*
Evalue x = 6 e y = 1
resultado 0

Evalue x = 1 e y = 11
resultado 2
*/