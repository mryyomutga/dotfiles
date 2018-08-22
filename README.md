# dotfiles

Linux設定ファイル

## インストールなど

`setup.sh`には`git`,`curl`,`xsel`をチェックするスクリプトがあります。

もしインストールしていない場合は以下のコマンドでインストールしてください。
```bash
$ sudo apt-get install git xsel curl    # Debian系
$ sudo pacman -S git xsel curl          # Arch Linux
```

必要なソフトのインストールが終了したら、以下のコマンドで設定できます

```bash
$ curl https://raw.githubusercontent.com/mryyomutga/dotfiles/master/install.sh | sh
```

この設定が不要になり一括削除したい場合は以下のコマンドでリセットできます

```bash
$ curl https://raw.githubusercontent.com/mryyomutga/dotfiles/master/uninstall.sh | sh
```

setup.shを実行すると、\~/に`.filename`形式で設定ファイルのシンボリックリンクが作成されます。（要は\~/.dotfilesの設定ファイルを読みに行っている）

そのため、自分で設定を変えたい場合、`~/.dotfiles`の設定ファイルを変更してください。

また、zshのコマンドにシンタックスをつけるスクリプトがネットに公開されており、それも同時にインストールするようになっています。

もし、シンタックス機能が不要の場合、`~/.dotfiles/zshrc`の16行目の

```sh
source ${HOME}/.dotfiles/.zsh-syntax-highlighting.zsh
```

を削除、コメントアウトすることで無効化できます。

## ファイル一覧

|filename|description|
|:---|:---|
|setup.sh|自動で設定をするスクリプト|
|reset.sh|自動で設定を戻すスクリプト|
|vimrc|vimの設定ファイル|
|zshrc|zshの設定ファイル|
|tmux.conf|tmuxの設定ファイル|
