// gcc -Wall -Wextra -std=c99 ej3c.c -o tresejc

#include <stdio.h>

int main(void){
    int x, y;

    printf("Ingrese el valor de x\n");
    scanf("%d", &x);
    printf("Ingrese el valor de y\n");
    scanf("%d", &y);

    y = (y + y);
    x = (x + y);

    printf("%d\n", y);
    printf("%d\n", x);

    return 0; 
}

/*
Evalue con x = 5, y = 4

y + y = 8
x + y = 13

Evalue con x = 6, y = 2

y + y = 4
x + y = 10

Evalue con x = 19, y = 45

y + y = 90
x + y = 109

*/