// gcc -Wall -Wextra -std=c99 minimos_estrella.c -o minestrella

#include <stdio.h>
#include <stdbool.h>
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

void imprimir_arreglo(int a[], int tam){
    printf("Los valores del arreglo son: \n");
    for (int i = 0; i < tam; i++)
    {
        printf("a[%d]: %d\n", i, a[i]);
    }
    
}

bool existe_par(int a[], int tam){
    for (int i = 0; i < tam; i++)
    {
        if (a[i] % 2 == 0)
        {
            return true;
        }
        
    }
    return false;
}

bool existe_impar(int a[],int tam){
    for (int i = 0; i < tam; i++)
    {
        if (a[i] % 2 != 0)
        {
            return true;
        }
        
    }
    return false;
}

bool todos_pares(int a[], int tam){
    for (int i = 0; i < tam; i++)
    {
        if (a[i] % 2 != 0)
        {
            return false;
        }
        
    }
    return true;
}

int minimo_pares(int a[],int tam){
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

int minimo_elemento(int a[], int tam){
    int min = INT_MAX;
    for (int i = 0; i < tam; i++)
    {
        if (a[i] < min)
        {
            min = a[i];
        }
        
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