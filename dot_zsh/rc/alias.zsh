abbr -S --quiet ll="exa -lg --time-style long-iso"
abbr -S --quiet la="exa -lag --time-style long-iso"
abbr -S --quiet lt="exa -l -T"

abbr -S --quiet g="git"
abbr -S --quiet gb="git branch"
abbr -S --quiet gs="git status"
abbr -S --quiet gf="git fetch"
abbr -S --quiet gc="git checkout"
abbr -S --quiet gl="git log"
abbr -S --quiet glg="git log --graph"
abbr -S --quiet gr="git rebase"
abbr -S --quiet gwl="git worktree list"

abbr -S --quiet tfp="terraform plan"
abbr -S --quiet tff="terraform fmt"
abbr -S --quiet tfi="terraform init"
abbr -S --quiet tfa="terraform apply"

abbr -S --quiet bi="bundle install --path vendor/bundle -j4"
abbr -S --quiet rc="bundle ex rails c"

#マージ済みのブランチを削除する
abbr -S --quiet gmdelete="git branch --merged|egrep -v \"\*|develop|master\"|xargs git branch -d"

abbr -S --quiet k="kubectl"
