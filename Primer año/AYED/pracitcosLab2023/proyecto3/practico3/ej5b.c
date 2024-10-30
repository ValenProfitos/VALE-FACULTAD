// gcc -Wall -Wextra -std=c99 ej5b.c -o cincoejb

#include <stdio.h>

int main(void){

    int x, y, i;

    printf("Ingrese valor de x: \n");
    scanf("%d", &x);
    printf("Ingrese valor de y: \n");
    scanf("%d", &y);
    i = 0;

    while (x >= y)
    {
        printf("Estados actuales de: x: %d, y: %d, i: %d\n", x, y, i);
        x = (x - y);
        i = (i + 1);
    }
    
    printf("Estados finales de: x: %d, y: %d, i: %d\n", x, y, i);

    return 0;
}

/*
Evalue con el ejemplo dado x = 13, y = 3
Estado inicial: Estados actuales de: x: 13, y: 3, i: 0
Luego de iter 1: Estados actuales de: x: 10, y: 3, i: 1
Luego de iter 2: Estados actuales de: x: 7, y: 3, i: 2
Luego de iter 3: Estados actuales de: x: 4, y: 3, i: 3
Luego de iter 4: Estados finales de: x: 1, y: 3, i: 4 
*/