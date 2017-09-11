function dvd_to_x264() {
  local dvd_to_x264_DIR
  local dvd_to_x264_FILE
  case $ACODEC in
    "")
      local dvd_to_x264_ACODEC="copy"
      ;;
    fix)
      local dvd_to_x264_ACODEC="aac"
      ;;
    *)
      local dvd_to_x264_ACODEC="$ACODEC"
      ;;
  esac
  for dvd_to_x264_DIR in "$@"
  do
    if [ -d "$dvd_to_x264_DIR" ]; then
      if [ -d "$dvd_to_x264_DIR/VIDEO_TS" ]; then
        local dvd_to_x264_INPUT="concat:"
        while IFS= read -r -d '' dvd_to_x264_FILE
        do
          dvd_to_x264_INPUT="$dvd_to_x264_INPUT|$dvd_to_x264_FILE"
        done <   <(find "$dvd_to_x264_DIR/VIDEO_TS" -iname "*.vob" -type f -print0)
        dvd_to_x264_INPUT=${dvd_to_x264_INPUT//concat:|/concat:/}
        echorun ffmpeg -i "$dvd_to_x264_INPUT" -c:v libx264 -preset fast -crf 20 -c:a "$dvd_to_x264_ACODEC" -threads 0 "$dvd_to_x264_DIR.x264.mp4"
      else
        echo
        echo "$0: no DVD in: $dvd_to_x264_DIR"
      fi
    else
      echo
      echo "$0: no directory: $dvd_to_x264_DIR"
    fi
  done
}
