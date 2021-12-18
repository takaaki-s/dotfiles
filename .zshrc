# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

bindkey -e

zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light momo-lab/zsh-abbrev-alias

# ripgrep
zinit ice as"program" from"gh-r" mv"ripgrep* -> rg" pick"rg/rg"; zinit light BurntSushi/ripgrep

# exa
zinit ice as"program" from"gh-r" mv"exa* -> exa" pick"bin/exa"; zinit light ogham/exa

# bat
zinit ice as"program" from"gh-r" mv"bat* -> bat" pick"bat/bat"; zinit light sharkdp/bat

# fd
zinit ice as"program" from"gh-r" mv"fd* -> fd" pick"fd/fd"; zinit light sharkdp/fd

# jq
zinit ice as"program" from"gh-r" mv"jq* -> jq" pick"jq"; zinit light stedolan/jq

zinit light reegnz/jq-zsh-plugin

zinit wait lucid for \
 silent atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zinit wait lucid is-snippet as"completion" for \
  OMZP::docker/_docker \
  OMZP::docker-compose/_docker-compose

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

export LSCOLORS=gxfxcxdxbxegedabagacad
autoload -Uz colors; colors
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors "${(s.:.)LSCOLORS}"

source $HOME/.zsh/rc/alias.zsh
source $HOME/.zsh/rc/config.zsh
source $HOME/.zsh/rc/function.zsh

[ -f ~/.zsh_local ] && source ~/.zsh_local


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
