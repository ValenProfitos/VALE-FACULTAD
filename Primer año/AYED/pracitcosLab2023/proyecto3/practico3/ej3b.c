// gcc -Wall -Wextra -std=c99 ejb.c -o tresejb

#include <stdio.h>

int main(void){
    int x, y;
    
    printf("Ingrese el valor de x\n");
    scanf("%d", &x);

    printf("Ingrese el valor de y\n");
    scanf("%d", &y);
    
    x = (x + y);
    y = (y + y);

    printf("%d\n", x);
    printf("%d\n", y);

    return 0;
}

/*
Evalue con x = 5, y = 4
x + y = 9 
y + y = 8

Evalue con x = 10, y = 25
x + y = 35
y + y = 50

Evalue con x = 78, y = 140
x + y = 218
y + y = 280
*/