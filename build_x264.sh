#!/bin/bash
NDK=/Users/wb/Library/Android/sdk/ndk-bundle
SYSROOT=$NDK/platforms/android-16/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64
PREFIX=../android_lib

function build_one
{
    ./configure \
    --prefix=$PREFIX \
    --enable-static \
    --enable-shared \
    --enable-pic \
    --disable-asm \
    --disable-cli \
    --host=arm-linux \
    --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
    --sysroot=$SYSROOT
    make clean
    make
    make install
}
build_one