#!/bin/bash  
SYSTEMROOT=$NDK_HOME/platforms/android-24/arch-arm/  
TOOLCHAIN=$NDK_HOME/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64  
  
function build_one  
{  
./configure \
    --prefix=$PREFIX \
    --enable-shared \
    --disable-static \
    --disable-doc \
    --disable-ffserver \
    --enable-cross-compile \
    --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
    --target-os=linux \
    --arch=arm \
    --sysroot=$SYSTEMROOT \
    --extra-cflags="-Os -fpic $ADDI_CFLAGS" \
    --extra-ldflags="$ADDI_LDFLAGS" \
    $ADDITIONAL_CONFIGURE_FLAG
}  
CPU=arm  
PREFIX=$(pwd | xargs dirname)/player/app/libs
ADDI_CFLAGS="-marm -DSMT_ANDROID"  
build_one  
