function webm_to_mp3() {
  ffmpeg -i "${1}" -vn -ab 128k -ar 44100 -y "${1}.mp3";
}
