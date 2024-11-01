// gcc -Wall -Wextra -std=c99 arreglosio.c -o arreglosio

#include <stdio.h>

void pedir_arreglo(int tam, int a[]){
    int i = 0;
    printf("Ingrese %d valores para el arreglo: \n", tam);
    while (i < tam)
    {
        printf("Ingrese el valor para a[%d]: \n", i);
        scanf("%d", &a[i]);
        i++;
    }
}

void imprimir_arreglo(int tam, int a[]){
    int i = 0;
    printf("Los valores del arreglo son: \n");
    while (i < tam)
    {
        printf("a[%d]: %d\n", i, a[i]);
        i++;
    }
    
}

int main(){
    const int tam = 5;
    int a[tam];

    pedir_arreglo(tam, a);
    imprimir_arreglo(tam, a);

    return 0;
}