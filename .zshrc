# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    if [[ $(command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin") -eq 0 ]];
    then
      print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b"
    else
      print -P "%F{160}▓▒░ The clone has failed.%f%b"
    fi
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

bindkey -e

zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit light momo-lab/zsh-abbrev-alias

# ripgrep
zinit ice as"program" from"gh-r" mv"ripgrep* -> rg" pick"rg/rg"; zinit light BurntSushi/ripgrep

# exa
zinit ice as"program" from"gh-r" mv"exa* -> exa" pick"bin/exa"; zinit light ogham/exa

# bat
zinit ice as"program" from"gh-r" mv"bat* -> bat" pick"bat/bat"; zinit light sharkdp/bat

# fd
zinit ice as"program" from"gh-r" mv"fd* -> fd" pick"fd/fd"; zinit light sharkdp/fd

zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
    zsh-users/zsh-completions

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1

zinit light rupa/z

## 履歴保存管理
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_no_store
setopt hist_ignore_space

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#export LS_COLORS=gxfxcxdxbxegedabagacad
export LSCOLORS=gxfxcxdxbxegedabagacad
autoload -Uz colors; colors
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors "${(s.:.)LSCOLORS}"

source $HOME/.zsh/rc/alias.zsh
source $HOME/.zsh/rc/config.zsh
source $HOME/.zsh/rc/function.zsh

[ -f ~/.zsh_local ] && source ~/.zsh_local

