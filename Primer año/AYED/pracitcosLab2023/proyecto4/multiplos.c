// gcc -Wall -Wextra -std=c99 -g multiplos.c -o multiplos

#include <stdio.h>
#include <stdbool.h>

void pedir_arreglo(int tam, int a[]){
    printf("Ingrese %d valores para el arrelo: \n", tam);
    for (int i = 0; i < tam; i++)
    {
        printf("Ingrese el valor para a[%d]: ", i);
        scanf("%d", &a[i]);
    }
    
}

void imprimir_arreglo(int tam, int a[]){
    printf("Los valores del arreglo son: \n");
    for (int i = 0; i < tam; i++)
    {
        printf("a[%d]: %d\n", i, a[i]);
    }
    
}

bool todos_pares(int tam, int a[]){
    for(int i = 0; i < tam; i++){
        if (a[i] % 2 !=0)
        {
            return false;
        }
        
    }

    return true;
}

bool existe_multiplo(int m, int tam, int a[]){
    for (int i = 0; i < tam; i++)
    {
        if(a[i] % m == 0){
            return true;
        }
    }
    return false;
}

int main(){
    const int tam = 5;
    int arreglo[tam];

    pedir_arreglo(tam, arreglo);
    imprimir_arreglo(tam, arreglo);

    int opcion;
    printf("Elija una opcion: \n");
    printf("1. Verificar si todos son pares\n");
    printf("2. Verificar si existe un multiplo de M\n");
    scanf("%d", &opcion);

    if (opcion == 1)
    {
        if(todos_pares(tam, arreglo)){
            printf("Todos los elementos del arreglo son pares.\n");
        }else {
            printf("No todos los elementos del arreglo son pares.\n");
        }
    } else if (opcion == 2)
    {
        int m;
        printf("Ingrese el valor de m: ");
        scanf("%d", &m);

        if (existe_multiplo(m, tam, arreglo))
        {
            printf("Existe al menos un multiplo de %d en el arreglo.\n", m);
        } else {
            printf("No existe ningun multiplo de %d en el arreglo.\n", m);
        }
        
    } else{
        printf("Opcion invalida.\n");
    }

    return 0;
    
}