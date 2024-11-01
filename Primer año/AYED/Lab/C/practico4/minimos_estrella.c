// gcc -Wall -Wextra -std=c99 minimos_estrella.c -o minestrella

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

void imprimir_arreglo(int a[], int tam){
    int i = 0;
    printf("Los valores del arreglo son: \n");
    while (i < tam)
    {
        printf("a[%d]: %d\n", i, a[i]);
        i++;
    }
    
}

bool existe_par(int a[], int tam){
    int i = 0;
    while (i < tam)
    {
        if (a[i] % 2 == 0)
        {
            return true;
        }
        i++;
    }
    return false;
}

bool existe_impar(int a[],int tam){
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

bool todos_pares(int a[], int tam){
    int i = 0;
    while (i < tam)
    {
        if (a[i] % 2 != 0)
        {
            return false;
        }
        i++;
    }
    return true;
}

int minimo_pares(int a[],int tam){
    int i = 0;
    int min = INT_MAX;
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
    int i = 0;
    int min = INT_MAX;
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

int minimo_elemento(int a[], int tam){
    int i = 0;
    int min = INT_MAX;
    while (i < tam)
    {
        if (a[i] < min)
        {
            min = a[i];
        }
        i++;
    }
    return min;
}

int main(void){
    int a[N];
    pedir_arreglo(a, N);
    imprimir_arreglo(a, N);

    if (todos_pares(a, N))
    {
        printf("Todos los elementos del arreglo son pares.\n");
        printf("No hay elementos impares en el arreglo (KINDA OBVIOUS, GIVEN THE PREVIOUS STATEMENT)\n");
        printf("El elemento minimo PAR es: %d\n", minimo_pares(a,N));
        
    } else
    {
        if (existe_par(a,N))
        {
            printf("El minimo elemento PAR es: %d\n", minimo_pares(a,N));
        } else
        {
            printf("No hay elementos pares en el arreglo\n");
        }
        
        if (existe_impar(a,N))
        {
            printf("El minimo elemento IMPAR es: %d\n", minimo_impares(a,N));
        }
    }
    
    printf("El minimo elemento del arreglo es: %d\n", minimo_elemento(a, N));

    return 0;
}