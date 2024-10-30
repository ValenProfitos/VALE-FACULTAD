// gcc -Wall -Wextra -std=c99 -g minimos.c -o minimos

#include <stdio.h>
#include <limits.h>

#define N 5

void pedir_arreglo(int a[], int tam){
    printf("Ingrese %d valores para el arreglo:\n", tam);
    for (int i = 0; i < tam; i++)
    {
        printf("Ingrese el valor para a[%d]: ", i);
        scanf("%d", &a[i]);
    }
    
    

}
int minimo_pares(int a[], int tam){
    int min = INT_MAX;

    for (int i = 0; i < tam; i++)
    {
        if ((a[i] < min) && (a[i] % 2 == 0)){
            min = a[i];
        }
    }
    return min;
}

int minimo_impares(int a[], int tam){
    int min = INT_MAX;

    for (int i = 0; i < tam; i++)
    {
        if ((a[i] < min) && (a[i] % 2 != 0))
        {
            min = a[i];
        }
        
    }
    return min;
}

int main(void){
    int a[N];
    pedir_arreglo(a, N);

    printf("El elemento minimo PAR es: %d\n", minimo_pares(a, N));
    printf("El elemento minimo IMPAR es: %d\n", minimo_impares(a, N));

    return 0;
}