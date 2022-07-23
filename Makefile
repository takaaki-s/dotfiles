OS := $(shell uname)
XDG_DATA_HOME ?= $(HOME)/.local/share

EXCLUSIONS := .DS_Store .git .gitignore .github .bin
CANDIDATES := $(wildcard .??*)
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
ZINIT_HOME := "$(HOME)/.local/share/zinit/zinit.git"

.PHONY: all dep install fzf vimplug

help:
	@echo 'dep      依存関係のライブラリ等をインストールします'
	@echo 'install  dotfilesを配置します'
	@echo 'all      すべてを実行します'

all: dep install

dep:
ifeq ($(OS),Darwin)
	@echo 'mac'
else
ifeq ($(OS),Linux)
	sudo apt-get update
	sudo apt-get install -y git curl zsh unzip gcc automake libncurses-dev pkg-config bison
else
	@echo 'not supported platform'
	@exit 1
endif
endif

install:
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

clean: ## Remove the dot files and this repo
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)

# fzf:
# 	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# 	~/.fzf/install

vimplug:
	sh -c 'curl -fLo "$(XDG_DATA_HOME)"/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

tmuxpluginmanager:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
