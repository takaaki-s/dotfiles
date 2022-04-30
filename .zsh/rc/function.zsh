function zz() {
   (z -l | fzf -q "$argv" | awk '{ print $2 }') | read -r recent
  if [ "$recent" ]; then
      cd "$recent" || return
  fi
}
