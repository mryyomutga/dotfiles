# dotfiles

自分のLinux設定ファイル

使いたいならどうぞ

## インストールなど

`setup.sh`には`git`,`curl`,`xsel`をチェックするスクリプトがあります。

もしインストールしていない場合は以下のコマンドでインストールしてください。
```bash
$ sudo apt-get install git xsel curl    # Debian系
$ sudo pacman -S git xsel curl          # Arch Linux
```

必要なソフトのインストールが終了したら、以下のコマンドで設定できます

```bash
$ curl https://raw.githubusercontent.com/mryyomutga/dotfiles/master/setup.sh | sh
```

この設定が不要になり一括削除したい場合は以下のコマンドでリセットできます

```bash
$ curl https://raw.githubusercontent.com/mryyomutga/dotfiles/master/reset.sh | sh
```
## ファイル一覧

- vimrc
- zshrc
- tmux.conf
