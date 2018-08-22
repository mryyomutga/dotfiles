# dotfiles

Linux設定ファイル

## インストールなど

`install.sh`には`git`,`curl`,`xsel`,`vim`,`wget`をチェックするスクリプトがあります

この設定を適用するには以下のコマンドを実行してください

```bash
$ curl https://raw.githubusercontent.com/mryyomutga/dotfiles/master/install.sh | sh
```

この設定が不要になり一括削除したい場合は以下のコマンドでリセットできます

```bash
$ curl https://raw.githubusercontent.com/mryyomutga/dotfiles/master/uninstall.sh | sh
```

`install.sh`を実行すると、\~/に`.filename`形式で設定ファイルのシンボリックリンクが作成されます

また、zshのコマンドにシンタックスをつけるスクリプトがネットに公開されており、それも同時にインストールするようになっています

もし、シンタックス機能が不要の場合、`~/.dotfiles/zshrc`の16行目の

```sh
source ${HOME}/.dotfiles/.zsh-syntax-highlighting.zsh
```

を削除、コメントアウトすることで無効化できます

## ファイル一覧

|filename|description|
|:---|:---|
|install.sh|自動で設定をするスクリプト|
|uninstall.sh|自動で設定を戻すスクリプト|
|vimrc|vimの設定ファイル|
|zshrc|zshの設定ファイル|
|tmux.conf|tmuxの設定ファイル|
