// gcc -Wall -Wextra -std=c99 asoc.c -o asoc

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

bool asoc_existe(int tam, struct asoc a[], clave_t c, valor_t v){
    int i = 0;
    while (i < tam)
    {
        if (a[i].clave == c && a[i].valor == v)
        {
            return true; // Se encontro la clave
        }
        i++;
    }
    return false; // No se encontro la clave
}

int main(){
    struct asoc a[N];
    int i = 0;

    // Pedir datos para el arreglo de asoc
    while (i < N)
    {
        printf("Ingrese la clave y el valor para el indice %d: \n", i);
        scanf(" %c %d", &a[i].clave, &a[i].valor);
        i++;
    }

    // Pedir una clave para buscar
    clave_t clave_buscada;
    valor_t valor_buscado;
    printf("Ingrese una clave a buscar: \n");
    scanf(" %c %d", &clave_buscada, &valor_buscado);
    
    // Verificar si la clave existe y mostrar un mensaje
    if (asoc_existe(N, a, clave_buscada, valor_buscado))
    {
        printf("La clave %c con valor %d existe en el arreglo de asociaciones.\n", clave_buscada, valor_buscado);
    } else {
        printf("La clave %c con valor %d no existe en el arreglo de asociaciones.\n", clave_buscada, valor_buscado);
    }
    
    return 0;
}