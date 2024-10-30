// gcc -Wall -Wextra -std=c99 ej1temab.c -o tb1

#include <stdio.h>
#include <assert.h>

int pedir_entero(char name);



int main(void){
    int i, j, k, I, J, K, tempi;

    // PRE: i = I, j = J, k = K, I > 0, J > 0, K > 0

    I = pedir_entero('I');
    J = pedir_entero('J');
    K = pedir_entero('K');

    i = I;
    j = J;
    k = K;

    assert(i == I && j == J && k == K && I > 0 && J > 0 && K > 0);

    tempi = I;

    i = i * j;
    j = j * k;
    k = k * tempi;

    // POST: i = I * J, j = J * K, k = K * i

    assert((i == I * J) && (j == J * K) && (k == K * I));

    printf("El valor de i: %d, el valor de j: %d, el valor de k: %d\n", i, j, k);

    return 0;
}

int pedir_entero(char name){
    int x;
    printf("Ingrese valor para %c: \n", name);
    scanf("%d", &x);
    return x;
}

