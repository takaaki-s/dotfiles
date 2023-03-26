[![CI](https://github.com/takaaki-s/dotfiles/actions/workflows/check.yml/badge.svg)](https://github.com/takaaki-s/dotfiles/actions/workflows/check.yml)


# 依存関係のインストール

```
sudo apt-get update && sudo apt-get install -y git curl unzip gcc
```

# chezmoiとdotfilesのインストール

```
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply takaaki-s
```
