set -x HISTCONTROL erasedups
set -g fish_prompt_pwd_dir_length 0
set -g theme_newline_cursor yes
set -g theme_display_vi yse
set -g theme_display_git no

set -g theme_date_format "+%Y/%m/%d %H:%M:%S"
set -g theme_powerline_fonts no

abbr g git
abbr gb "git branch"
abbr gc "git checkout"
abbr gl "git log"
abbr gr "git rebase"
abbr gf "git fetch"
abbr gs "git status"
abbr tfp "terraform plan"
abbr tff "terraform fmt"
abbr tfi "terraform init"
abbr tfa "terraform apply"
abbr tm "tmux new-session -A -s session-name"
abbr ll "exa -l"
abbr la "exa -la"
abbr ls "exa"
abbr lt "exa -l -T"

abbr bi "bundle install --path vendor/bundle -j4"
abbr rc "bundle ex rails c"
#マージ済みのブランチを削除する
abbr gmdelete 'git branch --merged|egrep -v \'\*|develop|master\'|xargs git branch -d'

# direnv init
if type direnv 1>/dev/null 2>&1
  eval (direnv hook fish)
else
  echo 'cant find direnv'
end

# pyenv init
if command -v pyenv 1>/dev/null 2>&1
  pyenv init - | source
end

# rbenv init
if command -v rbenv 1>/dev/null 2>&1
  rbenv init - | source
end

# nodenv init
if command -v nodenv 1>/dev/null 2>&1
  nodenv init - | source
end

# goenv init
if command -v goenv 1>/dev/null 2>&1
  goenv init - | source
end

#if type peco 1>/dev/null 2>&1
#  function fish_user_key_bindings
#    bind \cr 'peco_select_history (commandline -b)'
#  end
#end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

