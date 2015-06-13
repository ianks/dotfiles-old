#
# Helper functions for zsh
#

tarball() {
  tar cvzf "$1".tar.gz "$1"
}

replace() {
  if (( ! $+commands[ag] )); then
    echo "Error: ag executable not found"
    return 1
  fi

  find_this=$1
  shift
  replace_with=$1
  shift

  ag -l $find_this $* | xargs perl -pi -E "s/$find_this/$replace_with/g"
}

whoz_blockin() {
  lsof -i tcp:"$1"
}

bak() {
  cp -R "$1"{,.bak}
}

mkcd() {
  mkdir -p "$1" && cd $_
}

pacsort() {
  sudo armrr US
  sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
  sudo sh -c "rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist"
}
