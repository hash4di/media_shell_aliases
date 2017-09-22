function youtube_download_playlist() {
  tor_service ##Darwin
  ensure_command_updated youtube-dl || return $?
  torsocks youtube-dl --proxy socks5://127.0.0.1:9050 -o '%(playlist)s - %(playlist_id)s/%(id)s - %(title)s.%(ext)s' "$@"
}
