#!/bin/bash

export STAGING_DIR=/home/jen/workspace/routeproject/lede-sdk-17.01.0-ramips-mt7621_gcc-5.4.0_musl-1.1.16.Linux-x86_64/staging_dir
export PATH=$STAGING_DIR/toolchain-mipsel_24kc_gcc-5.4.0_musl-1.1.16/bin:$PATH
./configure \
--target-os=linux \
--arch=mipsel \
--enable-cross-compile \
--disable-shared \
--enable-static \
--enable-small \
--cross-prefix=mipsel-openwrt-linux- \
--extra-cflags=-mips32r2 \
--extra-ldflags="-Wl,-rpath-link=$STAGING_DIR/toolchain-mipsel_24kc_gcc-5.4.0_musl-1.1.16/lib" \
--sysroot=$STAGING_DIR/toolchain-mipsel_24kc_gcc-5.4.0_musl-1.1.16 \
--prefix=output/release

make clean
make -j8
make install