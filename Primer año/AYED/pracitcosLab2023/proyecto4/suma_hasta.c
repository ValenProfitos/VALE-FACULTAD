// gcc -Wall -Wextra -std=c99 -g suma_hasta.c -o sumaHasta

#include <stdio.h>
#include <assert.h>

int suma_hasta(int N){
    int total;

    total = 0;

    while (N > 0)
    {
        total = total + N;
        N-- ;
    }
    
    return total;
} 

int main(void){
    int N;
    printf("Sumar Hasta: ");
    scanf("%d", &N);

    assert(N > 0);
    printf("%d\n", suma_hasta(N));

    return 0;
}

