// gcc -Wall -Wextra -std=c99 minimos.c -o minimos

#include <stdio.h>
#include <stdbool.h>
#include <limits.h>
#include <assert.h>

#define N 5

void pedir_arreglo(int a[], int tam){
    int i = 0;
    printf("Ingrese %d valores para el arreglo: \n", tam);
    while (i < tam)
    {
        printf("Ingrese el valor para a[%d]: ", i);
        scanf("%d", &a[i]);
        i++;
    }
    
}

void imprimir_arreglo(int tam, int a[]){
    int i = 0;
    printf("Los valores del arreglo son: \n");
    while (i < tam)
    {
        printf("a[%d]: %d\n", i, a[i]);
        i++;
    }
    
}

bool existe_par(int tam, int a[]){
    int i = 0;
    while(i < tam)
    {
        if (a[i] % 2 == 0)
        {
            return true;
        }
        i++;
    }
    
    return false;
}

bool existe_impar(int tam, int a[]){
    int i = 0;
    while (i < tam)
    {
        if (a[i] % 2 != 0)
        {
            return true;
        }
        i++;
    }
    return false;
}

int minimo_pares(int tam, int a[]){
    assert(existe_par(tam, a) && "Error: El arreglo no contine pares");

    int min = INT_MAX;

    int i = 0;
    while (i < tam)
    {
        if ((a[i] < min) && (a[i] % 2 == 0))
        {
            min = a[i];
        }
        i++;
    }
    return min;
}

int minimo_impares(int a[], int tam){
    assert(existe_impar(tam, a) && "Error: El arreglo no contiene impares");

    int min = INT_MAX;

    int i = 0;
    while (i < tam)
    {
        if ((a[i] < min) && (a[i] % 2 != 0))
        {
            min = a[i];
        }
        i++;
    }
    return min;
}

int minimo_arreglo(int min_par, int min_impar){
    int min;
    if (min_par < min_impar)
    {
        min = min_par;
    } else {
        min = min_impar;
    }
    
    return min;
}

int main(void){
    assert(N > 0);
    int a[N];
    pedir_arreglo(a, N);
    imprimir_arreglo(N, a);

    int min_par = minimo_pares(N,a);
    int min_impar = minimo_impares(a, N);
    int min_total = minimo_arreglo(min_par, min_impar);

    printf("El elemento minimo PAR es: %d\n", minimo_pares(N, a));
    printf("El elemento minimo IMPAR es: %d\n", minimo_impares(a, N));
    printf("El minimo del arreglo es: %d\n", min_total);

    return 0;
}