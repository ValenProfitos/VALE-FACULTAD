// gcc -Wall -Wextra -std=c99 -g division.c -o division

#include <stdio.h>
#include <assert.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese valor entero para %c: \n", name);
    scanf("%d", &x);
    return x;
}

typedef struct 
{
    int cociente;
    int resto;
} div_t;

div_t division(int x, int y){
    div_t total;
    total.cociente = x / y;
    total.resto = x % y;

    return total;
}

int main(void){
    int x = pedir_entero('x');
    int y = pedir_entero('y');

    assert(y != 0);
    div_t resultado = division (x, y);

    printf("El cociente es: %d\n", resultado.cociente);
    printf("El resto es: %d\n", resultado.resto);

    return 0;
}
