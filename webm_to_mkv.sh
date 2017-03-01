function webm_to_mkv() {
  ffmpeg -i "${1}" \
         -c:v copy \
         -c:a copy \
         -threads 0 \
         "${1}.mkv"
}
