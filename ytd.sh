function ytd() {
  if [ -d /Volumes/Storage/Downloads ]; then
    cd /Volumes/Storage/Downloads || return $?
  elif [ -d "$HOME/Downloads" ]; then
    cd "$HOME/Downloads" || return $?
  fi
  parallel youtube-dl ::: "$@"
  return $?
}
