// gcc -Wall -Wextra -std=c99 ej1.c -o unoej

/* Entrada/Salida Hace un programa en C, que solicite el ingreso de los valores de las variables x,y,z e imprima el resultado de las expresiones de la tabla. En la ultima expresion, que tipo tiene el resultado en lenguaje "C"? */

#include <stdio.h>

int main(void){
    int x, y, z, v;
    printf("Ingrese el valor para x \n");
    scanf("%d", &x);
    printf("Ingrese el valor para y \n");
    scanf("%d", &y);
    printf("Ingrese el valor para z \n");
    scanf("%d", &z);

    v = x + y + 1;
    printf("%d + %d + 1 = %d\n", x, y, v);

    v = z * z + y * 45 - 15 * x;
    printf("%d * %d + %d * 45 - 15 * %d = %d\n", z, z, y, x, v);

    v = y - 2 == (x * 3 + 1) % 5;
    printf("%d - 2 == (%d * 3 + 1) %% 5 = %d\n", y, x, v);

    v = y / 2 * x;
    printf("%d / 2 * %d = %d\n", y, x, v);

    v = y < x * z;
    printf("%d < %d * %d = %d\n", y, x, z, v);
};

/*

Ingrese el valor para x 
7
Ingrese el valor para y 
3
Ingrese el valor para z 
5
7 + 3 + 1 = 11
5 * 5 + 3 * 45 - 15 * 7 = 55
3 - 2 == (7 * 3 + 1) % 5 = 0
3 / 2 * 7 = 7
3 < 7 * 5 = 1

*/

/*

Ingrese el valor para x 
1
Ingrese el valor para y 
10
Ingrese el valor para z 
8
1 + 10 + 1 = 12
8 * 8 + 10 * 45 - 15 * 1 = 499
10 - 2 == (1 * 3 + 1) % 5 = 0
10 / 2 * 1 = 5
10 < 1 * 8 = 0

*/

// La ultima expresion tiene resultado 0 o 1 pero en estos casos funcionan como False o True respectivamente