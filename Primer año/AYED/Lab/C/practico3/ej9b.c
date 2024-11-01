// gcc -Wall -Wextra -std=c99 ej9b.c -o nueveaej

#include <stdio.h>

int pedir_entero(char name){
    int x;
    printf("Ingrese el valor de %c: \n", name);
    scanf("%d", &x);
    return x;
}

void imprimir_entero(char name, int x){
    printf("%c = %d\n", name, x);
}

void pedir_arreglo(int tam, int a[]){
    printf("Ingrese %d valores para el arreglo: \n", tam);
    int i = 0;
    while (i < tam)
    {
        printf("Ingrese el valor para a[%d]: \n", i);
        scanf("%d", &a[i]);
        i++;
    }
    
}

void imprimir_arreglo(int tam, int a[]){
    int i = 0;
    printf("Los valores del arreglo son: \n");
    while (i < tam)
    {
        printf("a[%d]: %d\n", i, a[i]);
        i++;
    }
    
}

void imprimir_valor(int i, int a[]){
    printf("a[%d] = %d\n", i, a[i]);
}

void mostrar_estado(int x){
    printf("Estado %d: \n", x);
}

int main(void){
    const int tam = 4;

    int a[tam], i, c;

    i = pedir_entero('i');
    c = pedir_entero('c');
    pedir_arreglo(tam, a);
    
    mostrar_estado(1);
    imprimir_entero('i', i);
    imprimir_entero('c', c);
    imprimir_arreglo(tam, a);

    i = 0;
    c = 0;

    mostrar_estado(2);
    imprimir_entero('i', i);
    imprimir_valor(i, a);
    imprimir_entero('c', c);

    while (i < tam)
    {
        mostrar_estado(3);
        imprimir_entero('i', i);
        imprimir_valor(i, a);
        imprimir_entero('c', c);

        if (a[i] > 0)
        {
            c = c + 1;
        }

        mostrar_estado(4);
        imprimir_entero('i', i);
        imprimir_valor(i, a);
        imprimir_entero('c', c);
        
        i = i + 1;

        mostrar_estado(5);
        imprimir_entero('i', i);
        imprimir_valor(i, a);
        imprimir_entero('c', c);
    }
    
    mostrar_estado(6);
    imprimir_entero('i', i);
    imprimir_valor(i, a);
    imprimir_entero('c', c);
}