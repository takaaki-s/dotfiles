function zz() {
  read -r recent < <(z -l | fzf -q "$argv" | awk '{ print $2 }')
  if [ "$recent" ]; then
      cd "$recent" || return
  fi
}
