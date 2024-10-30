// gcc -Wall -Wextra -std=c99 arreglosio.c -o arreglosio

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

int main(){
    const int tam = 5;
    int a[tam];

    pedir_arreglo(tam, a);
    imprimir_arreglo(tam, a);

    return 0;
}