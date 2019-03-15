#include <stdio.h>

void foreground(){
    int i;
    printf("\e[38;5;0m%000 ");
    for(i = 1; i < 256; i++){
        printf("\e[38;5;%dm%03d ", i, i);
        if(i % 15 == 0 && i != 0)
            printf("\e[39;49m\n");
    }
    printf("\e[39;49;m\n");
}

void background(){
    int i;
    printf("\e[48;5;0m%000 ");
    for(i = 1; i < 256; i++){
        printf("\e[48;5;%dm%03d ", i, i);
        if(i % 15 == 0 && i != 0)
            printf("\e[39;49m\n");
    }
    printf("\e[36;49;m\n");
}

int main(void){
    foreground();
    background();

    return 0;
}
