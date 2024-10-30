// gcc -Wall -Wextra -std=c99 ej2.c -o dosej

/* Debugging Utiliza GDB o printf como ayuda y encontra los valores para las variables*/

#include <stdbool.h>
#include <stdio.h>

int main(void){
    int x, y, z, b, w;

    /* La primer expresion debe tener su variable multiplo de 4 para que sea True */

    printf("Ingrese el valor para x\n");
    scanf("%d", &x);

    if (x%4 == 0)
    {
        printf("%d\n", true);
    } else {
        printf("%d\n", false);
    }

    /* La segunda expresion devuelve true si x + y es igual a 0 Y si y - x es igual al opuesto de z */

    printf("Ingrese el valor para y\n");
    scanf("%d", &y);

    printf("Ingrese el valor para z\n");
    scanf("%d", &z);

    if (x + y == 0)
    {
        if (y - x == (-1) * z)
        {
            printf("%d\n", true);
        } else {
            printf("%d\n", false);
        }
    } else {
        printf("%d\n", false);
    }
    
    /* La ultima expresion devuelve False si not b Y w */

    printf("Ingrese el valor de b\n");
    scanf("%d", &b);

    printf("Ingrese el valor de w\n");
    scanf("%d", &w);

    if (!b && w)
    {
        printf("%d\n", true);
    } else {
        printf("%d\n", false);
    }
    
};

/*

Ingrese el valor para x
4
1
Ingrese el valor para y
-4
Ingrese el valor para z
8
1
Ingrese el valor de b
0
Ingrese el valor de w
1
1

*/