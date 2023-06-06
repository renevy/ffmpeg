## 常用的一些获取视频信息命令

1. 获取视频时长

./ffprobe -v quiet -of csv=p=0 -show_entries format=duration oceans.mp4 | \
  awk -F "," '{print int($1)}'

2. 获取视频格式

./ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1 oceans.mp4

3. 获取视频大小

ffprobe -v error -show_entries format=size -of default=noprint_wrappers=1:nokey=1 input_video.mp4

4. 获取视频分辨率

./ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=p=0:s=x oceans.mp4

5. 获取一帧图片

./ffmpeg -ss 00:00:05 -i oceans.mp4 -vframes 1 -q:v 2 output.jpg