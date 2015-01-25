#
# Helper functions for zsh
#

tarball() {
  tar cvzf "$1".tar.gz "$1" &> /dev/null
  tar tf "$1".tar.gz
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

  ag -l $find_this $* | xargs sed -i '' "s/$find_this/$replace_with/g"
}
