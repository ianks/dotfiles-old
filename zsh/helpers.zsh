tarball() {
  tar cvzf "$1".tar.gz "$1" &> /dev/null
  tar tf "$1".tar.gz
}
