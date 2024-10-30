// gcc -Wall -Wextra -std=c99 ej5b1.c -o cincoejbuno

#include <stdbool.h>
#include <stdio.h>

int main(void){
    int x, i, res;

    printf("Ingrese el valor entero de x: \n");
    scanf("%d", &x);
    printf("Ingrese el valor entero de i: \n");
    scanf("%d", &i);
    printf("Ingrese el valor booleano de res (0 (false), 1(true)): \n");
    scanf("%d", &res);

    i = 2;
    res = true;

    while (i < x && res)
    {
        printf("Estado actual de: x: %d, i: %d, res: %d\n", x, i, res);
        res = res && ((x % i) != 0);
        i = i + 1;
    }
    
    printf("Estado final de: x: %d, i: %d, res: %d\n", x, i, res);

    return 0;
}

/*
Evalue con los valores del ejemplo x: 5, i = 0, res = 0(false)
resultados:
Estado Inicial: Estado actual de: x: 5, i: 2, res: 1
luego de iter 1: Estado actual de: x: 5, i: 3, res: 1
luego de iter 2: Estado actual de: x: 5, i: 4, res: 1
luego de iter 3: Estado final de: x: 5, i: 5, res: 1
*/