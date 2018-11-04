# dotfiles

Linux設定ファイル

## インストールなど

`install.sh`には`git`,`curl`,`xsel`,`vim`,`wget`をチェックするスクリプトがあります

この設定を適用するには以下のコマンドを実行してください

```sh
$ curl https://raw.githubusercontent.com/mryyomutga/dotfiles/master/scripts/install.sh | sh
```

この設定が不要になり一括削除したい場合は以下のコマンドでリセットできます

```sh
$ curl https://raw.githubusercontent.com/mryyomutga/dotfiles/master/scripts/uninstall.sh | sh
```

`install.sh`を実行すると、\~/に`.filename`形式で設定ファイルのシンボリックリンクが作成されます

また、zshのコマンドにシンタックスをつけるスクリプトがネットに公開されており、それも同時にインストールするようになっています

もし、シンタックス機能が不要の場合、`~/.dotfiles/zsh/zshrc`の17~19行目を削除、コメントアウトすることで無効化できます

`peco`をインストールしている場合、`C-r`でzshの履歴をpecoで検索することができます。

|keybind|description|
|:---|:---|
|C-r|pecoでzshの履歴を検索する|
|C-j|カーソルを下に移動|
|C-k|カーソルを上に移動|
|C-f|下へスクロールする|
|C-b|上へスクロールする|
|C-q|pecoから抜ける|

## ファイル一覧

|filename|description|
|:---|:---|
|install.sh|自動で設定をするスクリプト|
|uninstall.sh|自動で設定を戻すスクリプト|
|vimrc|vimの設定ファイル|
|zshrc|zshの設定ファイル|
|init.vim|neovimの設定ファイル|
|tmux.conf|tmuxの設定ファイル|
|peco.conf.json|pecoの設定ファイル|
