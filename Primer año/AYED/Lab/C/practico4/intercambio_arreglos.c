// gcc -Wall -Wextra -std=c99 intercambio_arreglos.c -o interarray

#include <stdio.h>

void pedir_arreglo(int tam, int a[]){
    int i  = 0;
    printf("Ingrese %d valores para el arreglo: \n", tam);
    while (i < tam)
    {
        printf("Ingrese el valor para a[%d]: \n", i);
        scanf("%d", &a[i]);
        i++;
    }
}

void imprimir_arreglo(int tam, int a[]){
    int i  = 0;
    printf("Los valores del arreglo son: \n");
    while (i < tam)
    {
        printf("a[%d]: %d\n", i, a[i]);
        i++;
    }
    
}

void intercambiar(int tam, int a[], int i, int j){
    if (i >= 0 && i < tam && j >= 0 && j < tam)
    {
        int temp = a[i];
        a[i] = a[j];
        a[j] = temp;
        printf("Elementos intercambiados en las posiciones %d y %d\n", i, j);
    } else {
        printf("Posiciones invalidad. No se pudo intercambiar.\n");
    }
    
}

int main(){
    const int tam = 5;
    int a[tam];
    pedir_arreglo(tam, a);
    imprimir_arreglo(tam, a);

    int pos1, pos2;
    printf("Ingrese las posiciones que desea cambiar (0 a %d): ", tam - 1);
    scanf("%d %d", &pos1, &pos2);

    intercambiar(tam, a, pos1, pos2);

    printf("Arreglo modificado:\n");
    imprimir_arreglo(tam, a);

    return 0;
}