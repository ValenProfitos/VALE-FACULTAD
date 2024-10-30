// gcc -Wall -Wextra -std=c99 saludos.c -o saludosej

#include <stdio.h>

void imprimeHola(void){
    printf("Hola\n");
}

void imprimeChau(void){
    printf("Chau\n");
}

int main(void){
    imprimeHola();
    imprimeChau();
    imprimeHola();
    imprimeChau();
}