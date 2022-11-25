#!/bin/sh

. ./config.sh

mkdir -p ${ROOTFS_OVERLAY}/opt

${CROSS_COMPILE}gcc -O2 -g demo_races/compiler_opts.c -o $ROOTFS_OVERLAY/opt/compiler_opts
${CROSS_COMPILE}gcc -O2 -g demo_races/cpu_opts.c -o $ROOTFS_OVERLAY/opt/cpu_opts

#make ARCH=riscv CROSS_COMPILE=$CROSS_COMPILE -C linux M=$PWD/demo_races
#cp demo_races/demo_races.ko $ROOTFS_OVERLAY/opt
