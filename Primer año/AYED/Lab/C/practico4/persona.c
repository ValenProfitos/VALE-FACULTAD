// gcc -Wall -Wextra -std=c99 persona.c -o persona

#include <stdio.h>
#include <float.h>

typedef struct _persona
{
    char *nombre;
    int edad;
    float altura;
    float peso;
} persona_t;

float peso_promedio(unsigned int longitud, persona_t arr[]){
    float suma_peso = 0;
    for (unsigned int i = 0; i < longitud; i++)
    {
        suma_peso += arr[i].peso;
    }
    return suma_peso / longitud;
}

persona_t persona_de_mayor_edad(unsigned int longitud, persona_t arr[]){
    persona_t mayor_edad = arr[0];
    for (unsigned int i = 0; i < longitud; i++)
    {
        if (arr[i].edad > mayor_edad.edad)
        {
            mayor_edad = arr[i];
        }
        
    }
    return mayor_edad;
}

persona_t persona_de_menor_altura(unsigned int longitud, persona_t arr[]){
    persona_t menor_altura = arr[0];
    for (unsigned int i = 0; i < longitud; i++)
    {
        if (arr[i].altura < menor_altura.altura)
        {
            menor_altura = arr[i];
        }
        
    }
    return menor_altura;
}

int main(void){
    persona_t p1 = {.nombre="Paola", .edad=21, .altura=1.85, .peso=75};
    persona_t p2 = {.nombre="Luis", .edad=54, .altura=1.75, .peso=69};
    persona_t p3 = {.nombre="Julio", .edad=40, .altura=1.70, .peso=80};

    unsigned int longitud = 3;

    persona_t arr[] = {p1, p2, p3};

    printf("El peso promedio es: %f\n", peso_promedio(longitud, arr));
    
    persona_t p = persona_de_mayor_edad(longitud, arr);

    printf("El nombre de la persona con mayor edad es: %s\n", p.nombre);

    persona_t m = persona_de_menor_altura(longitud, arr);
    printf("El nombre de la persona con menos altura es: %s\n", m.nombre);
    return 0;
}