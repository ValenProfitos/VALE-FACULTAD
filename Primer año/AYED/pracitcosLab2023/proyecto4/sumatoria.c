// gcc -Wall -Wextra -std=c99 -g sumatoria.c -o sumatoria

#include <stdio.h>

void pedir_arreglo(int a[], int n_max){
    printf("Ingrese %d valores para el arreglo:\n", n_max);
    for(int i = 0; i < n_max; i++){
        printf("Ingrese el valor para a[%d]: ", i);
        scanf("%d", &a[i]);
    }
}

void imprimir_arreglo(int a[], int n_max){
    printf("Los valores del arreglo son:\n");
    for(int i = 0; i < n_max; i++){
        printf("a[%d]: %d\n", i, a[i]);
    }
}

int sumatoria(int a[], int n_max){
    int z = 0, i = 0;

    while (i < n_max)
    {
        z = z + a[i];
        i = i + 1;
    }
    
    return z;
}

int main(){
    int b;

    printf("Ingrese el tamaño del arreglo: ");
    scanf("%d", &b);

    int a[b];

    pedir_arreglo(a, b);
    imprimir_arreglo(a, b);

    int suma = sumatoria(a, b);
    printf("La suma de los elementos del arreglo es: %i\n", suma);

    return 0;
}