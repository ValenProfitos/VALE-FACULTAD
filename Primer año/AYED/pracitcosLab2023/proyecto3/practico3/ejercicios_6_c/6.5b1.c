// gcc -Wall -Wextra -std=c99 6.5b1.c -o seisejcincobuno

#include <stdbool.h>
#include <stdio.h>

int pedir_entero(char name){
    int x;
    printf("Ingresar el valor de %c \n", name);
    scanf("%d", &x);
    return x;
}

bool pedir_booleano(char name){
    int b;
    printf("Ingresar valor booleano de %c (0 (false) o 1 (true)):\n", name);
    scanf("%d", &b);
    return b != 0;
}

void imprimir_estados(int x, int i, bool res){
    printf("Estado actual de x = %d, i = %d, res = %d\n", x, i, res);
}

void imprimir_estados_finales(int x, int i, bool res){
    printf("Estado final de x = %d, i = %d, res = %d\n", x, i, res);
}

int main(void) {
    int x, i;
    bool res;

    x = pedir_entero('x');
    i = pedir_entero('i');
    res = pedir_booleano('r');

    i = 2;
    res = true;

    while (i < x && res)
    {
        imprimir_estados(x, i, res);
        res = res && ((x % i) != 0);
        i = i + 1;
    }

    imprimir_estados_finales(x, i, res);
    
    return 0;
}

/*
Evalue con lo mismo que el ejercicio original para verificar que funcione

Ingresar el valor de x 
5
Ingresar el valor de i 
0
Ingresar valor booleano de r (0 (false) o 1 (true)):
0
Estado actual de x = 5, i = 2, res = 1
Estado actual de x = 5, i = 3, res = 1
Estado actual de x = 5, i = 4, res = 1
Estado final de x = 5, i = 5, res = 1

*/