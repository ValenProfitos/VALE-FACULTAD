// gcc -Wall -Wextra -std=c99 ej2temab.c -o tb2

#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

#define N 5

void llena_con_notas(int a[], int tam){
    printf("Ingresa %d valores para el arreglo: \n", tam);
    for (int i = 0; i < tam; i++)
    {
        printf("Ingresa el valor para a[%d]: ", i);
        scanf("%d", &a[i]);
    }
    
}

bool hay_mas_de_3_aprobados(int a[], int tam){
    int cant_aprobados = 0;
    for (int i = 0; i < tam; i++)
    {
        if (a[i] >= 6 && a[i] <= 10)
        {
            cant_aprobados++;
        }
        
    }

    if (cant_aprobados >= 3)
    {
        return true;
    }
    
    return false;
}

int main(void){
    assert(N > 0);
    int a[N];

    llena_con_notas(a, N);
    if(hay_mas_de_3_aprobados(a, N)){
        printf("Hay mas de 3 aprobados\n");
    } else {
        printf("No hay mas de 3 aprobados\n");
    }

    return 0;
}