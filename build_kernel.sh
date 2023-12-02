#!/bin/bash

export ARCH=arm64
export PLATFORM_VERSION=12
export ANDROID_MAJOR_VERSION=s
make clean && make mrproper
make ARCH=arm64 exynos9820-beyondxks_defconfig
make menuconfig
make -j16
