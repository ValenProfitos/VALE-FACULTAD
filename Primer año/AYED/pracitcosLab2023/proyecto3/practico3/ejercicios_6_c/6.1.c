// gcc -Wall -Wextra -std=c99 6.1.c -o seisejuno

#include <stdio.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese el valor para %c: \n", name);
    scanf("%d", &x);
    return x;
}

void imprimir_entero(int resultado){
    printf("%d\n", resultado);
}

int main(void){
    int x, y, z, v;

    x = pedir_entero('x');
    y = pedir_entero('y');
    z = pedir_entero('z');

    v = x + y + 1;
    printf("x + y + 1 = ");
    imprimir_entero(v);

    v = z * z + y * 45 - 15 * x;
    printf("z * z + y * 45 - 15 * x = ");
    imprimir_entero(v);

    v = y - 2 == (x * 3 + 1) % 5;
    printf("y - 2 == (x * 3 + 1)%% 5 = ");
    imprimir_entero(v);

    v = y / 2 * x;
    printf("y / 2 * x = ");
    imprimir_entero(v);

    v = y < x * z;
    printf("y < x * z = ");
    imprimir_entero(v);

    return 0;
}

/*
Evalue con los mismos numeros que en el ejercicio original para verificar que funcionen de la misma forma

Ingrese el valor para x: 
7
Ingrese el valor para y: 
3
Ingrese el valor para z: 
5

x + y + 1 = 11
z * z + y * 45 - 15 = 55
y - 2 == (x * 3 + 1)% 5 = 0
y / 2 * x = 7
y < x * z = 1

Ingrese el valor para x: 
1
Ingrese el valor para y: 
10
Ingrese el valor para z: 
8

x + y + 1 = 12
z * z + y * 45 - 15 = 499
y - 2 == (x * 3 + 1)% 5 = 0
y / 2 * x = 5
y < x * z = 0
*/