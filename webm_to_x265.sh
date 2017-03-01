function webm_to_x265() {
  ffmpeg -i "${1}" \
         -c:v libx265 \
         -preset medium \
         -crf 28 \
         -c:a copy \
         -threads 0 \
         "${1}.x265.mkv"
}
