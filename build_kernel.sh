#!/bin/bash
export clang_exynos=/home/ravindu/Desktop/toolchain/Exynos9820/clang/host/linux-x86/clang-4639204-cfp-jopp/bin
export gcc_exynos=/home/ravindu/Desktop/toolchain/Exynos9820/gcc-cfp/gcc-cfp-jopp-only/aarch64-linux-android-4.9/bin
export ARCH=arm64
export PLATFORM_VERSION=12
export ANDROID_MAJOR_VERSION=s
export exynos_defconfig=modified_defconfig
export mkdtimg=/home/ravindu/Downloads/mkdtimg
clean_build() {
    make clean && make mrproper
    make ARCH=arm64 $exynos_defconfig
    make menuconfig
    make -j16
}

dirty_build() {
    make ARCH=arm64 $exynos_defconfig
    make menuconfig
    make -j16
}

scratch() {
    make ARCH=arm64 $exynos_defconfig
    make menuconfig
}

dirty() {
    make menuconfig
}

dtb () {
	make ARCH=arm64 $exynos_defconfig
	make menuconfig
	make dtbs
	}
	
clean () {
	make clean && make mrproper
	}	

echo -e "Choose an Option : (1, 2, 3, 4)

1. Clean build
2. Dirty build
3. Build Kernel config from scratch
4. Build Kernel config from previous run
5. Make dtb
6. Clean the source

Your choice : "

read -r value
if [ "$value" == 1 ]; then
    clean_build
elif [ "$value" == 2 ]; then
    dirty_build
elif [ "$value" == 3 ]; then
    scratch
elif [ "$value" == 4 ]; then
    dirty
elif [ "$value" == 5 ]; then
    dtb
elif [ "$value" == 6 ]; then
    clean           
else
    echo "Invalid input"
fi
