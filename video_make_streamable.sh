function video_make_streamable() {
  ffmpeg -i "$1" -c:v libx264 -preset fast -crf 20 -c:a aac -threads 0 "$1.x264.mp4"
  return $?
}
