// gcc -Wall -Wextra -std=c99 -g intercambio.c -o intercambio

#include <stdio.h>
#include <assert.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese el valor para %c \n", name);
    scanf("%d", &x);
    return x;
}

void intercambiar(int *x, int *y){

    int z, x1, y1;
    //Precondicion: No se verifica el tipo de dato
    assert(1);

    x1 = *x;
    y1 = *y;

    z = *x;
    *x = *y;
    *y = z;


    //Postcondicion: Los valores de x e y se han intercambiado
    assert((*x == y1) && (*y == x1));
}

int main(void){
    int a, b;

    a = pedir_entero('a');
    b = pedir_entero('b');

    printf("Valores inicales de a = %d, b = %d\n", a, b);

    intercambiar(&a, &b);

    printf("Valores intercambiados de a = %d, b = %d\n", a, b);

    return 0;
}