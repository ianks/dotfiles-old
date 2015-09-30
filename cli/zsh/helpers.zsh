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

killonport() {
  lsof -i TCP:$1 | grep LISTEN | awk '{print $2}' | xargs kill -9
}

bak() {
  cp -R "$1"{,.bak}
}

mkcd() {
  mkdir -p "$1" && cd $_
}
