# ffmpeg_android_build
大兵哥-- 安卓下编译ffmpeg脚本

## 历经两天的时间才把ffmpeg + x264 + faac 集成好

虽然网上一大堆，但是很多都是没有自己验证的，里面的坑很多。

## ffmpeg 下载地址 
https://ffmpeg.org/download.html


## faac 下载目录
http://downloads.sourceforge.NET/faac/faac-1.28.tar.gz

## x264下载目录
http://www.videolan.org/developers/x264.html

## 编译
libfaac和libx264需要单独编译生成。分别运行我写好的对应的脚本，

## 注意
其中faac 运行之后，需要再执行，make make install 网上是直接将这个命令放在脚本文件里面，但是这样是编译不过的，因为这个
搞到晚上12点都没有搞好。最后通过这中方式，编译成功。

## 最后
最后运行build_ffmpeg_x264_faac.sh 脚本，即可得到ffmpeg 集成了 x264 + faac 编码的库。然后移植到安卓工程中，开发直播类APP了。

## star
集成比较辛苦，喜欢给个星星吧。





