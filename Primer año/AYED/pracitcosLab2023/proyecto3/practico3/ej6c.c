// gcc -Wall -Wextra -std=c99 ej6c.c -o seisejc

#include <stdio.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese un valor para %c: \n", name);
    scanf("%d", &x);
    return x;
}

void imprimir_entero(char name, int x){
    printf("%c = %d\n", name, x);
}

int main(void){
    int x, y, z, m;

    x = pedir_entero('x');
    y = pedir_entero('y');
    z = pedir_entero('z');
    m = pedir_entero('m');

    if(x < y){
        m = x;
    } else if (x >= y){
        m = y;
    }

    printf("Estado 1:\n");
    imprimir_entero('x', x);
    imprimir_entero('y', y);
    imprimir_entero('z', z);
    imprimir_entero('m', m);

    if(m < z){
    } else {
        m = z;
    }

    printf("Estado Final:\n");
    imprimir_entero('x', x);
    imprimir_entero('y', y);
    imprimir_entero('z', z);
    imprimir_entero('m', m);

    return 0;
}

/*
Las ventajas de esta version son:
1)Reutilizacion de codigo: creamos dos funciones 'pedir_entero' e 'imprimir_entero' que me piden valores y los imprimen con etiquetas. Esto hace que el codigo sea mas limpio y legible y permite reutilizar estas funciones en otros lugares del programa si es necesario.
2)Claridad: El codigo principal se vuelve mas claro y conciso al utilizar estas funciones
*/