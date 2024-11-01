// gcc -Wall -Wextra -std=c99 prim_iguales.c -o primiguales

#include <stdio.h>

#define N 5

void pedir_arreglo(int a[],int tam){
    int i = 0;
    printf("Ingrese %d valores para el arreglo: \n", tam);
    while (i < tam)
    {
        printf("Ingrese el valor para a[%d]: ", i);
        scanf("%d", &a[i]);
        i++;
    }
    
}

int prim_iguales(int a[], int tam){
    int i = 0;
    int contador = 1;
    int longitud_maxima = 1;

    while (i < tam)
    {
        if (a[i] == a[i - 1])
        {
            contador++;
            if (contador > longitud_maxima)
            {
                longitud_maxima = contador;
            }
            
        } else {
            contador = 1;
        }
        i++;
    }
    return longitud_maxima;
}

void imprimir_tramo_inicial(int a[], int longitud_maxima) {
    int i = 0;
    printf("Tramo inicial de elementos iguales: \n[");
    while (i < longitud_maxima) {
        printf("%d,", a[i]);
        i++;
    }
    printf("]\n");
}

int main(){
    int a[N];

    pedir_arreglo(a,N);

    int longitud_tramo = prim_iguales(a, N);
    printf("Longitud del trame inicial mas largo de elementos iguales: %d\n", longitud_tramo);
    imprimir_tramo_inicial(a, longitud_tramo);

    return 0;
}