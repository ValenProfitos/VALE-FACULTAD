// gcc -Wall -Wextra -std=c99 ej3a.c -o tresaej

/* Traduci al lenguaje C el programa 1a del practico. Esos programas estan escritos en pseudocodigo de la materia y la traduccion a C no siempre es directa */

#include <stdio.h>

int main(void){
    int x;
    printf("Ingrese el valor de x\n");
    scanf("%d", &x);
    x = 5;
    printf("%d\n", x);
}