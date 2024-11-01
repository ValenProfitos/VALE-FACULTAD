// gcc -Wall -Wextra -std=c99 primo.c -o primo

#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

bool es_primo(int num){
    if (num <= 1)
    {
        return false;
    }
    int i = 2;
    while (i * i <= num)
    {
        if (num % i == 0)
        {
            return false;
        }
        i++;
    }
    return true;
}

int nesimo_primo(int N){
    int contador = 0;
    int numero = 2;

    while (true)
    {
        if (es_primo(numero))
        {
            contador++;
            if (contador == N)
            {
                return numero;
            }
            
        }
        numero++;
    }
    return -1; 
}

int main(){
    int n;
    printf("Ingrese un numero para encontrar el n-esimo primo: \n");
    scanf("%d", &n);

    assert(n >= 0 && "El numero debe ser no negativo");

    if (n < 0)
    {
        printf("Error: El numero debe ser positivo");
    } else {
        printf("El %d-esimo numero primo es: %d\n", n, nesimo_primo(n));
    }
    return 0;
}