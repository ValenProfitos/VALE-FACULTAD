// gcc -Wall -Wextra -std=c99 -g nesimo_primo.c -o nesimoPrimo

#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

bool es_primo(int num){
    if (num <= 1)
    {
        return false;
    }
    for (int i = 2; i * i <= num; i++)
    {
        if (num % i == 0)
        {
            return false;
        }
        
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
    return -1; //En caso de un error o valor no valido
}

int main(){
    int n;
    printf("Ingrese un numero para encontrar el n-esimo primo: \n");
    scanf("%d", &n);

    assert(n >= 0 && "El numero debe ser no negativo"); //Validar que el numero no sea negativo

    if (n < 0)
    {
        printf("Error: El numero debe ser positivo");
    } else {
        printf("El %d-esimo numero primo es: %d\n", n, nesimo_primo(n));
    }

    return 0;
    
}
