// gcc -Wall -Wextra -std=c99 -g ejercicio06.c -o ejseis

#include <stdio.h>

void pedir_arreglo(int n_max, int a[]){
    printf("Ingrese %d valores para el arreglo:\n", n_max);
    for(int i = 0; i < n_max; i++){
        printf("Ingrese el valor para a[%d]: ", i);
        scanf("%d", &a[i]);
    }
}

void imprimir_arreglo(int n_max, int a[]){
    printf("Los valores del arreglo son:\n");
    for(int i = 0; i < n_max; i++){
        printf("a[%d]: %d\n", i, a[i]);
    }
}

int main(){
    int n_max;

    printf("Ingrese el tamaño maximo del arreglo: ");
    scanf("%d", &n_max);

    int a[n_max];

    pedir_arreglo(n_max, a);

    imprimir_arreglo(n_max, a);

    return 0;
}