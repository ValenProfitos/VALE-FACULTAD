// gcc -Wall -Wextra -std=c99 ej2temac.c -o tc2

#include <stdio.h>
#include <stdbool.h>
#include <float.h>
#include <assert.h>

#define N 5

void llenar_con_temperaturas(float a[], int tam){
    for (int i = 0; i < tam; i++)
    {
        printf("Ingrese un valor(float) para a[%d]: ", i);
        scanf("%f", &a[i]);
    }
    
}

bool hay_mas_de_2_altas(float a[], int tam){
    int cant_altas = 0;
    for (int i = 0; i < tam; i++)
    {
        if (a[i] >= 30.0)
        {
            cant_altas++;
        }
    }

    if (cant_altas > 2)
    {
        return true;
    }

    return false;
}

int main(void){
    assert(N>0);
    float a[N];
    bool res = false;

    llenar_con_temperaturas(a,N);
    if (hay_mas_de_2_altas(a, N))
    {
        res = true;
        printf("%d,Hay mas de 3 temperaturas mayores a 30.0\n", res);
    } else {
        printf("%d, No hay mas de 3 altas\n", res);
    }
    return 0;
}