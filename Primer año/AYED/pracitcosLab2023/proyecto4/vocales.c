// gcc -Wall -Wextra -std=c99 -g vocales.c -o vocales

#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

char pedir_char(){
    char n;
    printf("Ingrese una letra: ");
    scanf("%c", &n);
    return n;
}

bool es_vocal(char letra){
    if (letra == 'a' || letra == 'e' || letra == 'i' || letra == 'o' || letra == 'u' || letra == 'A' || letra == 'E' || letra == 'I' || letra == 'O' || letra == 'U')
    {
        return true;
    } else {
        return false;
    }
    
}

int main(){
    char letra = pedir_char();
    bool esVocal = es_vocal(letra);

    if(esVocal){
        printf("El caracter '%c' es una vocal.\n", letra);
    }else {
        printf("El caracter '%c' no es una vocal.\n", letra);
    }

    assert(esVocal == es_vocal(letra));

    return 0;
}
