#include <stdio.h>

void red_foreground(){
    int i;
    // printf("\e[38;2;0;0;0m%000 ");
    for(i = 1; i < 256; i++){
        printf("\e[38;2;%d;0;0m%03d ", i, i);
        if(i % 15 == 0 && i != 255)
            printf("\e[39;49m\n");
    }
    printf("\e[39;49m\n");
}

void red_background(){
    int i;
    // printf("\e[48;2;;0;0;0m%000 ");
    for(i = 1; i < 256; i++){
        printf("\e[48;2;%d;0;0m%03d ", i, i);
        if(i % 15 == 0 && i != 255)
            printf("\e[39;49m\n");
    }
    printf("\e[39;49m\n");
}
void green_foreground(){
    int i;
    // printf("\e[38;2;0;0;0m%000 ");
    for(i = 1; i < 256; i++){
        printf("\e[38;2;0;%d;0m%03d ", i, i);
        if(i % 15 == 0 && i != 255)
            printf("\e[39;49m\n");
    }
    printf("\e[39;49m\n");
}

void green_background(){
    int i;
    // printf("\e[48;2;;0;0;0m%000 ");
    for(i = 1; i < 256; i++){
        printf("\e[48;2;0;%d;0m%03d ", i, i);
        if(i % 15 == 0 && i != 255)
            printf("\e[39;49m\n");
    }
    printf("\e[39;49m\n");
}
void blue_foreground(){
    int i;
    // printf("\e[38;2;0;0;0m%000 ");
    for(i = 1; i < 256; i++){
        printf("\e[38;2;0;0;%dm%03d ", i, i);
        if(i % 15 == 0 && i != 255)
            printf("\e[39;49m\n");
    }
    printf("\e[39;49m\n");
}

void blue_background(){
    int i;
    // printf("\e[48;2;;0;0;0m%000 ");
    for(i = 1; i < 256; i++){
        printf("\e[48;2;0;0;%dm%03d ", i, i);
        if(i % 15 == 0 && i != 255)
            printf("\e[39;49m\n");
    }
    printf("\e[39;49m\n");
}

void background(){
    int r, g, b;
    for(r = 1; r < 256; r++){
        for(g = 1; g < 256; g++){
            for(b = 1; b < 256; b++){
                printf("\e[48;2;%d;%d;%dm%03d ", r, g, b, b);
                if(b % 15 == 0)
                    printf("\e[39;49m\n");
            }
        }
    }
    printf("\e[36;49;m\n");
}

int main(void){
    // red_foreground();
    // green_foreground();
    // blue_foreground();
    red_background();
    green_background();
    blue_background();

    // background();

    return 0;
}
