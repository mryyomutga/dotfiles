# escape sequences

`ESC` escape sequence.

`Ctrl-v + Esc -> \[` (vim)

## Cursor

|Code|Effect|
|:---|:---|
|nA|カーソルを上にn移動させる|
|nB|カーソルを下にn移動させる|
|nC|カーソルを右にn移動させる|
|nD|カーソルを左にn移動させる|
|nE|カーソルをn行下の先頭に移動させる|
|nF|カーソルをn行上の先頭に移動させる|
|nG|カーソルを左端からn番目に移動させる|
|n;mH|カーソルを上端からn，左端からm番目に移動させる|
|nJ|画面消去．(省略,0 = カーソルより後，1 = カーソルより前，2 = 全体)|
|nK|行消去．(省略,0 = カーソルより後，1 = カーソルより前，2 = 全体)|
|nS|n行下にスクロールさせる|
|nT|n行上にスクロールさせる|

## console color

|Code|Effect|Note|
|:---|:---|:---|
|[0m|Reset/Normal||
|[1m|Bold or increased intensity||
|[2m|Faint(decreased intensity, True Color)||
|[3m|Italic||
|[4m|Underline||
|[5m|Slow Blink||
|[6m|Rapid Blink||
|[7m|reverse video||
|[8m|Conceal||
|[9m|Crossed-out||
|[10m|Primary font(default)||
|[30~37m|set foreground color|See [30-37-color](#3/4bit-color)|
|[38m|set foreground color|Next arguments are `5;n`[24bit-colors](#24bit-colors) or `2;r;g;b`|
|[39m|Default foreground color||
|[40m|Set background color|See [30-37-color](#3/4bit-color)|
|[48m|Set background color|Next arguments are `5;n`[24bit-colors](#24bit-colors) or `2;r;g;b`|
|[49m|Default background color||
|[90~97m|Set bright foreground color||
|[100~107m|Set bright background color||

### 3/4bit-color

|Number|Color|
|:---|:---|
|0|Black|
|1|Red|
|2|Green|
|3|Yellow|
|4|Blue|
|5|Magenta|
|6|Cyan|
|7|White|

### 24bit-colors

This command running(Bash or Zsh). That result is able to use colors on your terminal.

```zsh
for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo
```

## Example

Bold, (0, 128, 255), underline

```bash
echo "[5;38;2;0;128;255;4mHello world."
```

```c
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
```

```bash
xsel -bo > test.c && gcc test.c && ./a.out
```

- <https://www.mm2d.net/main/prog/c/console-02.html>
- <https://www.mm2d.net/main/prog/c/console-02.html>