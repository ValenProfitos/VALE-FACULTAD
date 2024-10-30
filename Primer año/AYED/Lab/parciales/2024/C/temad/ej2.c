// gcc -Wall -Wextra -std=c99 ej2.c -o ej2

#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

#define N 5

void llena_con_char(char a[], int tam){
    for (int i = 0; i < tam; i++)
    {
        printf("Ingresa valor (char y minuscula) para a[%d]: ", i);
        scanf(" %c", &a[i]);
    }
    
}

bool es_vocal(char c){
    return (c == 'a' || c == 'e' || c == 'i' || c == '0' || c == 'u');
}

bool hay_mas_de_2_consonantes(char a[], int tam){
    int cant_consonantes = 0;
    for (int i = 0; i < tam; i++)
    {
        if ((a[i] >= 'a' && a[i] <= 'z') && !(es_vocal(a[i])) )
        {
            cant_consonantes++;
        }
        
    }
    
    if (cant_consonantes > 2)
    {
        return true;
    }
    
    return false;
}

int main(void){
    assert(N>0);
    char a[N];

    bool res = false;

    llena_con_char(a, N);
    if (hay_mas_de_2_consonantes(a, N))
    {
        res = true;
        printf("%d, Hay mas de 2 consonantes en el arreglo\n", res);
    } else {
        printf("%d, No hay mas de dos consonantes en el arreglo\n", res);
    }
    
    return 0;
}