#!/bin/bash
NDK=/Users/wb/Library/Android/sdk/ndk-bundle
SYSROOT=$NDK/platforms/android-16/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64
PREFIX=$(pwd)/liboutput

# 加入x264编译库
EXTRA_CFLAGS="-I./android_lib/include" 
EXTRA_LDFLAGS="-L./android_lib/lib"


function build_one
{
    ./configure \
    --target-os=linux \
    --prefix=$PREFIX \
    --enable-cross-compile \
    --enable-runtime-cpudetect \
    --disable-asm \
    --disable-doc \
    --arch=arm \
    --cc=$TOOLCHAIN/bin/arm-linux-androideabi-gcc \
    --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
    --disable-stripping \
    --nm=$TOOLCHAIN/bin/arm-linux-androideabi-nm \
    --sysroot=$SYSROOT \
    --enable-gpl \
    --enable-shared \
    --disable-static \
    --enable-version3 \
    --enable-small \
    --disable-vda \
    --disable-iconv \
    --disable-encoders \
    --enable-libx264 \
    --enable-libfaac \
    --enable-encoder=libx264 \
    --enable-encoder=libfaac \
    --disable-muxers \
    --enable-muxer=mov \
    --enable-muxer=ipod \
    --enable-muxer=psp \
    --enable-muxer=mp4 \
    --enable-muxer=avi \
    --disable-decoders \
    --enable-decoder=aac \
    --enable-decoder=aac_latm \
    --enable-decoder=h264 \
    --enable-decoder=mpeg4 \
    --disable-demuxers \
    --enable-demuxer=h264 \
    --enable-demuxer=mov \
    --disable-parsers \
    --enable-parser=aac \
    --enable-parser=ac3 \
    --enable-parser=h264 \
    --disable-protocols \
    --enable-protocol=file \
    --enable-protocol=rtmp \
    --disable-bsfs \
    --enable-bsf=aac_adtstoasc \
    --enable-bsf=h264_mp4toannexb \
    --disable-indevs \
    --enable-zlib \
    --disable-outdevs \
    --disable-ffprobe \
    --disable-ffplay \
    --disable-ffmpeg \
    --disable-ffserver \
    --disable-debug \
    --extra-cflags=$EXTRA_CFLAGS \
    --extra-ldflags=$EXTRA_LDFLAGS
    make clean
    make
    make install
}
build_one