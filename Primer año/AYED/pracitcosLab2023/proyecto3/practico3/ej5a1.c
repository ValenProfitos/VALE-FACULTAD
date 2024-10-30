// gcc -Wall -Wextra -std=c99 ej5a1.c -o cincoejauno

#include <stdio.h>

int main(void){
    int i;
    printf("Ingrese el valor de i: \n");
    scanf("%d", &i);

    while (i != 0)
    {
        printf("Estado actual de i: %d\n", i);
        i = 0;
    }

    printf("Estado final de i: %d\n", i);

    return 0;
}

/*
Evalue con i=6
resultado:
Estado actual de i: 6
Estado final de i: 0
*/