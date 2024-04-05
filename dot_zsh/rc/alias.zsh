abbr -S --quite ll="exa -lg --time-style long-iso"
abbr -S --quite la="exa -lag --time-style long-iso"
abbr -S --quite lt="exa -l -T"

abbr -S --quite g="git"
abbr -S --quite gb="git branch"
abbr -S --quite gs="git status"
abbr -S --quite gf="git fetch"
abbr -S --quite gc="git checkout"
abbr -S --quite gl="git log"
abbr -S --quite glg="git log --graph"
abbr -S --quite gr="git rebase"
abbr -S --quite gwl="git worktree list"

abbr -S --quite tfp="terraform plan"
abbr -S --quite tff="terraform fmt"
abbr -S --quite tfi="terraform init"
abbr -S --quite tfa="terraform apply"

abbr -S --quite bi="bundle install --path vendor/bundle -j4"
abbr -S --quite rc="bundle ex rails c"

#マージ済みのブランチを削除する
abbr -S --quite gmdelete="git branch --merged|egrep -v \"\*|develop|master\"|xargs git branch -d"

abbr -S --quite k="kubectl"
