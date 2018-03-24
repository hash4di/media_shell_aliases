function ytd() {
  youtube_mount || return $?
  if [ -d /Volumes/YouTube ]; then
    cd /Volumes/YouTube || return $?
  elif [ -d "$HOME/Downloads" ]; then
    cd "$HOME/Downloads" || return $?
  fi
  parallel youtube-dl ::: "$@"
  return $?
}
