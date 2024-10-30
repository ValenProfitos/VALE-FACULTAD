// gcc -Wall -Wextra -std=c99 ej3temab.c -o tb3

#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

#define N 5

typedef struct 
{
    int cuantos_aprobados;
    int cuantos_promocionados;
    bool hay_promocionados;
} s_resultado;

void llena_con_notas(int a[], int tam){
    printf("Ingresa %d valores para el arreglo: \n", tam);
    for (int i = 0; i < tam; i++)
    {
        printf("Ingresa el valor para a[%d]: ", i);
        scanf("%d", &a[i]);
    }
    
}

s_resultado resultados(int a[], int tam){
    s_resultado res = {0, 0, false};
    for (int i = 0; i < tam; i++)
    {
        if (a[i] >= 6 && a[i] <= 10)
        {
            res.cuantos_aprobados++;
            if (a[i] >= 8)
            {
                res.cuantos_promocionados++;
                res.hay_promocionados = true;
            }
            
        }
        
    }
    return res;
}


int main(void){
    assert(N > 0);
    int a[N];

    llena_con_notas(a, N);
    s_resultado res = resultados(a, N);

    printf("La cantidad de aprobados es: %d\n", res.cuantos_aprobados);
    if (res.hay_promocionados)
    {
        printf("Hay al menos un promocionado.\n");
        printf("La cantidad de promocionados es: %d\n", res.cuantos_promocionados);
    } else {
        printf("No hay promocionados\n");
    }
    
    return 0;
}