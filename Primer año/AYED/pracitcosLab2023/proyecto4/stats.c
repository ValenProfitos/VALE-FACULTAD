// gcc -Wall -Wextra -std=c99 -g stats.c -o stats

#include <stdio.h>
#include <limits.h>
#include <assert.h>
#include <float.h>

void pedir_arreglo(float a[], int tam){
    for (int i = 0; i < tam; i++)
    {
        printf("Ingrese el valor de a[%d]:\n", i);
        scanf("%f", &a[i]);
    }
    
}

float minimo(float a[], int tam){
    float min = FLT_MAX;

    for (int i = 0; i < tam; i++)
    {
        if (a[i] < min)
        {
            min = a[i];
        }
        
    }
    return min;
}

float maximo(float a[], int tam){
    float max = -FLT_MAX;

    for (int i = 0; i < tam; i++)
    {
        if (a[i] > max)
        {
            max = a[i];
        }
        
    }
    return max;
}

float sumatoria(float a[], int tam){
    int i = 0;
    float sum = 0.0;

    while (i < tam)
    {
        sum = sum + a[i];
        i++;
    }
    return sum;
}

struct datos_t
{
    float maximo;
    float minimo;
    float promedio;
};

struct datos_t stats(float a[], int tam){
    struct datos_t datos;
    datos.maximo = maximo(a, tam);
    datos.minimo = minimo(a, tam);
    datos.promedio = sumatoria(a, tam) / tam;

    printf("Maximo: %f\n", datos.maximo);
    printf("Minimo: %f\n", datos.minimo);
    printf("Promedio: %f\n", datos.promedio);

    return datos;
}

int main(){
    int n;
    printf("Tamaño del arreglo: \n");
    scanf("%d", &n);
    assert(n > 0);

    float(a[n]);
    pedir_arreglo(a, n);
    stats(a, n);

    return 0;
}
