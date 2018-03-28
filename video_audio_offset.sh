function video_audio_offset() {
  case $OFFSET in
    "")
      video_audio_offset_VALUE="3.84"
      ;;
    *)
      video_audio_offset_VALUE="$OFFSET"
      ;;
  esac
  video_audio_offset_SUFFIX=$(basename "${1//\./\//}" | tail -n 1)
  ffmpeg -i "$1" \
         -itsoffset "$video_audio_offset_VALUE" \
         -i "$1" \
         -map 0:v \
         -map 1:a \
         -vcodec copy \
         -acodec copy \
         "$1.audio_offset.$video_audio_offset_VALUE.$video_audio_offset_SUFFIX"
}
