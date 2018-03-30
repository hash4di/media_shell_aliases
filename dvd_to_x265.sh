function dvd_to_x265() {
  local dvd_to_x265_DIR
  for dvd_to_x265_DIR in "$@"
  do
    if [ -d "$dvd_to_x265_DIR" ]; then
      if [ -d "$dvd_to_x265_DIR/VIDEO_TS" ]; then
        local dvd_to_x265_INPUT
        dvd_to_x265_INPUT="$(find "$dvd_to_x265_DIR/VIDEO_TS" -iname "*.vob" -type f | tr "\n" "|")"
        dvd_to_x265_INPUT="concat:$dvd_to_x265_INPUT"
        dvd_to_x265_INPUT="${dvd_to_x265_INPUT/concat:|concat:/}"
        echorun ffmpeg -i "$dvd_to_x265_INPUT" -c:v libx265 -preset medium -crf 28 -c:a copy -threads 0 "$dvd_to_x265_DIR.x265.mp4" || \
          echo "Note that you may want to reinstall ffmpeg with 'brew reinstall ffmpeg --with-x265'"
      else
        echo
        echo "$0: no DVD in: $dvd_to_x265_DIR"
      fi
    else
      echo
      echo "$0: no directory: $dvd_to_x265_DIR"
    fi
  done
}
