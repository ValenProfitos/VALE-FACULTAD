// gcc -Wall -Wextra -std=c99 -g asoc.c -o asoc

#include <stdio.h>
#include <stdbool.h>

#define N 5

typedef char clave_t;
typedef int valor_t;

struct asoc
{
    clave_t clave;
    valor_t valor;
};

bool asoc_existe(int tam, struct asoc a[], clave_t c){
    for (int i = 0; i < tam; i++)
    {
        if (a[i].clave == c)
        {
            return true; // Se encontro la clave
        }
        
    }
    return false; // No se encontro la clave
}

int main(){
    struct asoc a[N];

    // Pedir datos para el arreglo de asoc
    for (int i = 0; i < N; i++)
    {
        printf("Ingrese la clave y el valor para el indice %d:\n", i);
        scanf(" %c %d", &a[i].clave, &a[i].valor);
    }

    // Pedir una clave para buscar
    clave_t clave_buscada;
    printf("Ingrese una clave a buscar:\n");
    scanf(" %c", &clave_buscada);
    
    // Verificar si la clave existe y mostrar un mensaje
    if (asoc_existe(N, a, clave_buscada))
    {
        printf("La clave %c existe en el arreglo de asociaciones.\n", clave_buscada);
    } else {
        printf("La clave %c no existe en el arreglo de asociaciones.\n", clave_buscada);
    }

    return 0;
    

}
