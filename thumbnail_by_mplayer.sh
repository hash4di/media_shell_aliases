function thumbnail_by_mplayer() {
  parallel "find . -name '*.{}' -type f" ::: mp4 avi wmv mkv | \
    parallel "test -f {}-thumbnails/done || mplayer -benchmark -nosound -quiet -zoom -vf scale=420:-3,tile=2:2 -vo jpeg:outdir={}-thumbnails -sstep 60 {} ; touch {}-thumbnails/done"
}
