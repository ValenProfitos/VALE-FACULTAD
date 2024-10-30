// gcc -Wall -Wextra -std=c99 -g cuantos.c -o cuantos

#include <stdio.h>
#define N 5

void pedir_arreglo(int a[], int tam){
    printf("Ingrese %d valores para el arreglo:\n", tam);
    for (int i = 0; i < tam; i++)
    {
        printf("Ingrese el valor para a[%d]: ", i);
        scanf("%d", &a[i]);
    }
    
}

struct comp_t
{
    int menores;
    int iguales;
    int mayores;
};

struct comp_t cuantos(int tam, int a[], int elem){
    struct comp_t comp = {0, 0, 0};

    for (int i = 0; i < tam; i++)
    {
        if (a[i] < elem)
        {
            comp.menores++;
        } else if (a[i] == elem)
        {
            comp.iguales++;
        } else
        {
            comp.mayores++;
        }
        
        
        
    }
    return comp;
}

int main(){
    int a[N];
    int numero;

    pedir_arreglo(a, N);

    printf("Ingrese un numero: ");
    scanf("%d", &numero);

    struct comp_t resultados = cuantos(N, a, numero);

    printf("Menores: %d\n", resultados.menores);
    printf("Iguales: %d\n", resultados.iguales);
    printf("Mayores: %d\n", resultados.mayores);

    return 0; 
}
