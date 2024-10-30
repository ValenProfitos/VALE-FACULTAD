// gcc -Wall -Wextra -std=c99 ej2.c -o dosej

#include <stdbool.h>
#include <stdio.h>

int main(void){
    int x, y, z, b, w;
    /*La primer expresion debe tener su variable multiplo de 4 para que sea True*/

    printf("Ingrese valor entero para x\n");
    scanf("%d", &x);

    if(x%4 == 0){
        printf("%d\n", true);
    } else{
        printf("%d\n", false);
    }

    printf("Ingrese valor entero para y\n");
    scanf("%d", &y);

    printf("Ingrese Valor entero para z\n");
    scanf("%d", &z);

    /*La segunda expresion debe tener un y que sea igual al inverso de x y un z que sea el doble de x para que sea True*/

    if(x + y == 0 && y - x == (-1) * z){
        printf("%d\n", true);
    } else {
        printf("%d\n", false);
    }

    /*La tercera expresion debe tener b igual 1(true) y w igual a 1(true) para que sea False u 0*/

    printf("Ingrese valor de b\n");
    scanf("%d", &b);

    printf("Ingrese valor de w\n");
    scanf("%d", &w);

    printf("Resultado de !b && w = %d\n", !b && w);

    return 0;
}