// gcc -Wall -Wextra -std=c99 ej3.c -o ej3

#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

#define N 6

typedef struct 
{
    int cuantas_a;
    int cuantas_x;
    int cuantas_z;
} s_total;


void llena_con_char(char a[], int tam){
    for (int i = 0; i < tam; i++)
    {
        printf("Ingresa valor (char y minuscula) para a[%d]: ", i);
        scanf(" %c", &a[i]);
    }
    
}

bool es_a_x_z(char c){
    return (c == 'a' || c == 'x' || c == 'z');
}

s_total totales(char a[], int tam){
    s_total res = {0, 0, 0};
    for (int i = 0; i < tam; i++)
    {
        if (es_a_x_z(a[i]))
        {
            if (a[i] == 'a')
            {
                res.cuantas_a++;
            } else if (a[i] == 'x')
            {
                res.cuantas_x++;
            } else {
                res.cuantas_z++;
            }
            
        }
        
    }
    
    return res;
}

int main(void){
    assert(N>0);
    char a[N];

    llena_con_char(a, N);

    s_total res = totales(a,N);

    printf("Cantidad de 'a': %d\n", res.cuantas_a);
    printf("Cantidad de 'x': %d\n", res.cuantas_x);
    printf("Cantidad de 'z': %d\n", res.cuantas_z);

    return 0;
}