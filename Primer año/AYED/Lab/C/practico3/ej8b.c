// gcc -Wall -Wextra -std=c99 ej8b.c -o ochobej

#include <stdio.h>
#include <stdbool.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese el valor de %c: \n", name);
    scanf("%d", &x);
    return x;
}

bool pedir_booleano(char name){
    int b;
    printf("Ingresar valor booleano de %c (0 (false) o 1 (true)):\n", name);
    scanf("%d", &b);
    return b;
}

void imprimir_booleano(char name, bool res){
    printf("%c = %d\n", name, res);
}

void imprimir_entero(char name, int x){
    printf("%c = %d\n", name, x);
}


int main(void){
    int x, i;
    bool res;

    x = pedir_entero('x');
    i = pedir_entero('i');
    res = pedir_booleano('r');

    i = 2;
    res = 1;

    while (i < x && res)
    {
        res = res && ((x % i) != 0);
        i = i + 1;

        printf("Estado luego del bucle: \n");
        imprimir_entero('x', x);
        imprimir_entero('i', i);
        imprimir_booleano('r', res);
    }
    
    printf("Estado final: \n");
    imprimir_entero('x', x);
    imprimir_entero('i', i);
    imprimir_booleano('r', res);

    return 0;
}