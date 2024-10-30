// gcc -Wall -Wextra -std=c99 ej5a.c -o cincoaej

#include <stdio.h>

int main(void){
    int x, y;

    printf("Ingrese valor para x:\n");
    scanf("%d", &x);

    printf("Ingrese valor para y:\n");
    scanf("%d", &y);
    
    if (x >= y)
    {
        x = 0;
    } else if (x <= y) {
        x = 2;
    }
    
    printf("Valor actual de x: %d\n", x);

    return 0;
}

/*



*/