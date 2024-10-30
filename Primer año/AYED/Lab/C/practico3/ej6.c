// gcc -Wall -Wextra -std=c99 ej6.c -o seisej

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
    
    if (x < y)
    {
        m = x;
    } else {
        m = y;
    }
    
    printf("Estado 1:\n");
    imprimir_entero('x', x);
    imprimir_entero('y', y);
    imprimir_entero('z', z);
    imprimir_entero('m', m);

    if (m < z)
    {
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