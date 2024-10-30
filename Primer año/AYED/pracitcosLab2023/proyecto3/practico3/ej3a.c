// gcc -Wall -Wextra -std=c99 ej3a.c -o treseja

#include <stdio.h>

int main(void){
    int x;
    printf("Ingrese el valor de x\n");
    scanf("%d", &x);
    x = 5;
    printf("%d\n", x);
}

/* Evalue
x = 1, resultado es 5
x = 167, resultado es 5
x = 89, resultado es 5
*/