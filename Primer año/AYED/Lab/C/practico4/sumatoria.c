// gcc -Wall -Wextra -std=c99 sumatoria.c -o sumatoria

#include <stdio.h>

void pedir_arreglo(int tam, int a[]){
    printf("Ingrese %d valores para el arreglo: \n", tam);
    for (int i = 0; i < tam; i++)
    {
        printf("Ingrese el valor para a[%d]: \n", i);
        scanf("%d", &a[i]);
    }
}

void imprimir_arreglo(int tam, int a[]){
    printf("Los valores del arreglo son: \n");
    for (int i = 0; i < tam; i++)
    {
        printf("a[%d]: %d\n", i, a[i]);
    }
    
}

int sumatoria(int a[], int n_max){
    int z = 0, i = 0;

    while (i < n_max)
    {
        z = z + a[i];
        i++;
    }

    return z;  
}

int main(){
    int b;

    printf("Ingrese el tamanio del arreglo: \n");
    scanf("%d", &b);

    int a[b];

    pedir_arreglo(b, a);
    imprimir_arreglo(b, a);

    int suma = sumatoria(a, b);
    printf("La suma de los elementos del arreglo es: %i\n", suma);

    return 0;
}