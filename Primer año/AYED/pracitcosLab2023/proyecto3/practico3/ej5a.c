// gcc -Wall -Wextra -std=c99 ej5a.c -o cincoeja

#include <stdio.h>

int main(void) {
    int i;
    printf("Ingrese el valor de i: \n");
    scanf("%d", &i);

    while (i != 0)
    {
        printf("%d\n", i);
        i = i-1;
    }
    
    return 0;
}

/*
Evalue con i = 4
resultados: 4
            3
            2
            1
*/