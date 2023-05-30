abbrev-alias ll="exa -lg --time-style long-iso"
abbrev-alias la="exa -lag --time-style long-iso"
abbrev-alias lt="exa -l -T"

abbrev-alias g="git"
abbrev-alias gb="git branch"
abbrev-alias gs="git status"
abbrev-alias gf="git fetch"
abbrev-alias gc="git checkout"
abbrev-alias gl="git log"
abbrev-alias glg="git log --graph"
abbrev-alias gr="git rebase"
abbrev-alias gwl="git worktree list"

abbrev-alias tfp="terraform plan"
abbrev-alias tff="terraform fmt"
abbrev-alias tfi="terraform init"
abbrev-alias tfa="terraform apply"

abbrev-alias bi="bundle install --path vendor/bundle -j4"
abbrev-alias rc="bundle ex rails c"

#マージ済みのブランチを削除する
abbrev-alias gmdelete="git branch --merged|egrep -v \"\*|develop|master\"|xargs git branch -d"

abbrev-alias k="kubectl"

