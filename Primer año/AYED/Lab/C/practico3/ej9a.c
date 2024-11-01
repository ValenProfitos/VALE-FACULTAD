// gcc -Wall -Wextra -std=c99 ej9a.c -o nueveaej

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
    int i = 0;
    printf("Ingrese %d valores para el arreglo: \n", tam);
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

void mostrar_estado(int x){
    printf("Estado %d: \n", x);
}


int main(void){
    const int tam = 4;
    int a[tam], i, s;


    i = pedir_entero('i');
    s = pedir_entero('s');
    pedir_arreglo(tam, a);
    imprimir_arreglo(tam, a);

    i = 0;
    s = 0;

    mostrar_estado(1);
    imprimir_entero('i', i);
    imprimir_entero('s', s);

    while (i < tam)
    {
        mostrar_estado(2);
        imprimir_entero('i', i);
        imprimir_entero('s', s);

        s = s + a[i];
        i = i  + 1;

        mostrar_estado(3);
        imprimir_entero('i', i);
        imprimir_entero('s', s);
    }
    
    mostrar_estado(4);
    imprimir_entero('i', i);
    imprimir_entero('s', s);

    return 0;
}