#include <stdio.h>

void foreground(){
    int i;
    printf("[38;5;0m%000 ");
    for(i = 1; i < 256; i++){
        printf("[38;5;%dm%03d ", i, i);
        if(i % 15 == 0 && i != 0)
            printf("[39;49m\n");
    }
    printf("[39;49;m\n");
}

void background(){
    int i;
    printf("[48;5;0m%000 ");
    for(i = 1; i < 256; i++){
        printf("[48;5;%dm%03d ", i, i);
        if(i % 15 == 0 && i != 0)
            printf("[39;49m\n");
    }
    printf("[36;49;m\n");
}

int main(void){
    foreground();
    background();

    return 0;
}
