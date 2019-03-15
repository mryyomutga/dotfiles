# escape sequences

`ESC` escape sequence is `\e` or ``.

`Ctrl-v + Esc -> ^[` (vim)

`\e` or `` + `[` is CSI - Control Sequence Introducer.

## Cursor

|Code|Name|Effect|
|:---|:---|:---|
|\e[nA|CUU - Cursor Up|Move the cursor n(default `1`) cells in the given direction.|
|\e[nB|CUD - Cursor Down||
|\e[nC|CUF - Cursor Forward||
|\e[nD|CUB - Cursor Back||
|\e[nE|CNL - Cursor Next Line|Moves cursor to beginning of the line n(default `1`) lines down.|
|\e[nF|CPL - Cursor Previous Line|Moves cursor to beginngin of the line n(default `1`) line up.|
|\e[nG|CHA - Cursor Horizontal Absolute|Moves the cursor to column n(default `1`).|
|\e[n;mH|CUP - Cursor Position|Moves the cursor to row n, column m.|
|\e[nJ|ED - Erase in Display|Clears part of the screen. n=0,clear from cursor to end. n=1,clear from cursor to beginning. n=2,clear entire screen.|
|\e[nK|EL - Erase in Line|erases part of the line. n=0,clear from cursor to the end. n=1,clear from cursor to beginning. n=2,clear entire line.|
|\e[nS|SU - Scroll Up|Scroll whole page up by n(default `1`) lines.|
|\e[nT|SD - Scroll Down|Scroll whole page down by n(default `1`) lines.|

## console color

|Code|Effect|Note|
|:---|:---|:---|
|\e[0m|Reset/Normal||
|\e[1m|Bold or increased intensity||
|\e[2m|Faint(decreased intensity, True Color)||
|\e[3m|Italic||
|\e[4m|Underline||
|\e[5m|Slow Blink||
|\e[6m|Rapid Blink||
|\e[7m|reverse video||
|\e[8m|Conceal||
|\e[9m|Crossed-out||
|\e[10m|Primary font(default)||
|\e[30~37m|set foreground color|See [3/4bit-color](#3/4bit-color)|
|\e[38m|set foreground color|Next arguments are `5;n`[24bit-colors](#24bit-colors) or `2;r;g;b`|
|\e[39m|Default foreground color||
|\e[40m|Set background color|See [3/4bit-color](#3/4bit-color)|
|\e[48m|Set background color|Next arguments are `5;n`[24bit-colors](#24bit-colors) or `2;r;g;b`|
|\e[49m|Default background color||
|\e[90~97m|Set bright foreground color||
|\e[100~107m|Set bright background color||

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

Bold, RGB(0,128,255), underline <font color="#0080FF"><u>__Hello world__</u></font>

```bash
echo "\e[5;38;2;0;128;255;4mHello world."    # \e[
echo "[5;38;2;0;128;255;4mHello world."    # ^[[
```

```c
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
```

```bash
xsel -bo > test.c && gcc test.c && ./a.out
```

- <https://www.mm2d.net/main/prog/c/console-02.html>
- <https://en.wikipedia.org/wiki/ANSI_escape_code>