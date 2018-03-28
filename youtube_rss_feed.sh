function youtube_rss_feed() {
  parallel \
    -v \
    "open -a Safari http://gdata.youtube.com/feeds/api/users/{/}/uploads" \
    ::: \
    "$@"
  return $?
}
