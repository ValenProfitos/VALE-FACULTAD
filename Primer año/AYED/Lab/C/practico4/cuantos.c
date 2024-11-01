// gcc -Wall -Wextra -std=c99 cuantos.c -o cuantos

#include <stdio.h>

#define N 5

void pedir_arreglo(int a[], int tam){
    int i = 0;
    printf("Ingrese %d valores para el arreglo:\n", tam);
    while (i < tam)
    {
        printf("Ingrese el valor para a[%d]: ", i);
        scanf("%d", &a[i]);
        i++;
    }
    
}

struct comp_t
{
    int menores;
    int iguales;
    int mayores;
};

struct comp_t cuantos(int tam, int a[], int elem)
{
    struct comp_t comp = {0, 0, 0};

    int i = 0;
    while (i < tam)
    {
        if (a[i] < elem)
        {
            comp.menores++;
        } else if (a[i] == elem)
        {
            comp.iguales++;
        } else {
            comp.mayores++;
        }
        i++;
    }
    
    return comp;
};

int main(){
    int a[N];
    int numero;

    pedir_arreglo(a, N);

    printf("Ingrese un numero: \n");
    scanf("%d", &numero);

    struct comp_t resultados = cuantos(N, a, numero);
    
    printf("Menores a %d: %d\n", numero, resultados.menores);
    printf("Iguales a %d: %d\n", numero, resultados.iguales);
    printf("Mayores a %d: %d\n", numero, resultados.mayores);

    return 0;
}