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

  ag -l $find_this $* | xargs sed -i '' "s/$find_this/$replace_with/g"
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

rtfm() {
  man "$@" 2> /dev/null || $BROWSER "http://www.google.com/search?q=$@" 2> /dev/null
}
