[![CI](https://github.com/takaaki-s/dotfiles/actions/workflows/check.yml/badge.svg)](https://github.com/takaaki-s/dotfiles/actions/workflows/check.yml)


# 依存関係のインストール

```sh
sudo apt-get update && sudo apt-get install -y git curl unzip gcc
```

tmux を asdf で install する場合は下記も

```sh
sudo apt-get install -y make automake pkg-config libncurses5-dev bison
```

# chezmoiとdotfilesのインストール

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply takaaki-s
```

tmux の plugin の install

```
# tmux 起動後
[Ctrl+B] + [I]
```
