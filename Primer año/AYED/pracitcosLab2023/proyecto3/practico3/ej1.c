// gcc -Wall -Wextra -std=c99 ej1.c -o unoej

/*Entrada/Salida. Hace un programa en C, que solicite el ingreso de los valores de las variables x,y,z e imprima el resultado de las siguientes expresiones. Completa los resultados de la tabla para los estados dados. ¿En la ultima expresion, que tipo tiene el resultado en lenguaje “C”?*/

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
    printf("x + y + 1 = %d\n", v);
    v = z * z + y * 45 - 15 * x;
    printf("z * z + y * 45 - 15 = %d\n", v);
    v = y - 2 == (x * 3 + 1) % 5;
    printf("y - 2 == (x * 3 + 1)%% 5 = %d\n", v);
    v = y / 2 * x;
    printf("y / 2 * x = %d\n", v);
    v = y < x * z;
    printf("y < x * z = %d\n", v);
    return 0;
}

/* 
x = 7, y = 3, z = 5

x + y + 1 = 11
z * z + y * 45 - 15 = 55
y - 2 == (x * 3 + 1)% 5 = 0
y / 2 * x = 7
y < x * z = 1

x = 1, y = 10, z = 8

x + y + 1 = 12
z * z + y * 45 - 15 = 499
y - 2 == (x * 3 + 1)% 5 = 0
y / 2 * x = 5
y < x * z = 0

Tiene de resultado 0 o 1 pero en estos casos son un False o True respectivamente 
*/