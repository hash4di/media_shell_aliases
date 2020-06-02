function dvd2mp4() {
  cat ${1}/*.VOB | caffeinate -i -m ffmpeg -i - -acodec aac -ac 2 -ab 128k -vcodec libx264 -preset fast -crf 20 -threads 0 ${2}.mp4
  return $?
}
