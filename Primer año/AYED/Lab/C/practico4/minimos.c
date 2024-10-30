// gcc -Wall -Wextra -std=c99 minimos.c -o minimos

#include <stdio.h>
#include <limits.h>
#include <assert.h>

#define N 5

void pedir_arreglo(int a[], int tam){
    printf("Ingrese %d valores para el arreglo: \n", tam);
    for (int i = 0; i < tam; i++)
    {
        printf("Ingrese el valor para a[%d]: ", i);
        scanf("%d", &a[i]);
    }
    
}

void imprimir_arreglo(int tam, int a[]){
    printf("Los valores del arreglo son: \n");
    for (int i = 0; i < tam; i++)
    {
        printf("a[%d]: %d\n", i, a[i]);
    }
    
}

int existe_par(int tam, int a[]){
    for (int i = 0; i < tam; i++)
    {
        if (a[i] % 2 == 0)
        {
            return 1;
        }
        
    }
    
    return 0;
}

int existe_impar(int tam, int a[]){
    for (int i = 0; i < tam; i++)
    {
        if (a[i] % 2 != 0)
        {
            return 1;
        }
        
    }
    return 0;
}

int minimo_pares(int tam, int a[]){
    assert(existe_par(tam, a) && "Error: El arreglo no contine pares");

    int min = INT_MAX;

    for (int i = 0; i < tam; i++)
    {
        if ((a[i] < min) && (a[i] % 2 == 0))
        {
            min = a[i];
        }
        
    }
    return min;
}

int minimo_impares(int a[], int tam){
    assert(existe_impar(tam, a) && "Error: El arreglo no contiene impares");

    int min = INT_MAX;

    for (int i = 0; i < tam; i++)
    {
        if ((a[i] < min) && (a[i] % 2 != 0))
        {
            min = a[i];
        }
        
    }
    return min;
}

int minimo_arreglo(int min_par, int min_impar){
    return (min_par < min_impar) ? min_par : min_impar;
}

int main(void){
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