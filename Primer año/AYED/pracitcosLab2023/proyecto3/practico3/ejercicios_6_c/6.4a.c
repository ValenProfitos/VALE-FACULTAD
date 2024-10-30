// gcc -Wall -Wextra -std=c99 6.4a.c -o seisejcuatroa

#include <stdio.h>

int pedir_entero(char name){
    int x;
    printf("Ingresar el valor de %c\n", name);
    scanf("%d", &x);
    return x;
}

void imprimir_entero(int x){
    printf("%d\n", x);
}

int main(void) {
    int x, y;

    x = pedir_entero('x');
    y = pedir_entero('y');

    if(x >= y){
        x = 0;
    } else {
        x = 2;
    }

    imprimir_entero(x);

    return 0;
}

/*
Evalue con lo mismo que el ejercicio original para verificar que funcione

Ingresar el valor de x
6
Ingresar el valor de y
1
0

Ingresar el valor de x
1
Ingresar el valor de y
11
2
*/