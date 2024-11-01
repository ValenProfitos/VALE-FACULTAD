// gcc -Wall -Wextra -std=c99 -g primo2.c -o primodos

#include <stdio.h>
#include <stdbool.h>

bool es_primo(int num){
    if (num <= 1)
    {
        return false;
    }
    int i = 2;
    while (i  * i <= num)
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
    
}

int main(){
    int n;
    do
    {
        printf("Ingrese un numero para encontrar el n-esimo primo: \n");
        scanf("%d", &n);
        if (n < 0)
        {
            printf("Error: El numero debe ser no negativo.\n");
        }
        
    } while (n < 0);
    
    printf("El %d-esimo numero primo es: %d\n", n, nesimo_primo(n));

    return 0;

}