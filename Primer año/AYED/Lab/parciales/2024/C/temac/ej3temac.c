// gcc -Wall -Wextra -std=c99 ej3temac.c -o tc3

#include <stdio.h>
#include <float.h>
#include <assert.h>

#define N 5

typedef struct 
{
    int cuantas_bajas;
    int cuantas_medias;
    int cuantas_altas;
} s_temperaturas;

void llenar_con_temperaturas(float a[], int tam){
    for (int i = 0; i < tam; i++)
    {
        printf("Ingrese un valor(float) para a[%d]: ", i);
        scanf("%f", &a[i]);
    }
    
}

s_temperaturas totales(float a[], int tam){
    s_temperaturas res = {0, 0, 0};
    for (int i = 0; i < tam; i++)
    {
        if (a[i] < 15.0)
        {
            res.cuantas_bajas++;
        } else if (a[i] >= 15.0 && a[i] <= 30.0){
            res.cuantas_medias++;
        } else {
            res.cuantas_altas++;
        }
        
    }
    return res;
}

int main(void){
    assert(N>0);
    float a[N];

    llenar_con_temperaturas(a, N);

    s_temperaturas res = totales(a,N);

    printf("Cantidad de temp bajas: %d\n", res.cuantas_bajas);
    printf("Cantidad de temp medias: %d\n", res.cuantas_medias);
    printf("Cantidad de temp altas: %d\n", res.cuantas_altas);

    return 0;
}
