// gcc -Wall -Wextra -std=c99 prim_iguales.c -o primiguales

#include <stdio.h>

#define N 5

void pedir_arreglo(int a[],int tam){
    printf("Ingrese %d valores para el arreglo: \n", tam);
    for (int i = 0; i < tam; i++)
    {
        printf("Ingrese el valor para a[%d]: ", i);
        scanf("%d", &a[i]);
    }
    
}

int prim_iguales(int a[], int tam){
    int contador = 1;
    int longitud_maxima = 1;

    for (int i = 0; i < tam; i++)
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
        
    }
    return longitud_maxima;
}

void imprimir_tramo_inicial(int a[], int longitud_maxima) {
    printf("Tramo inicial de elementos iguales: \n[");
    for (int i = 0; i < longitud_maxima; i++) {
        printf("%d,", a[i]);
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