#!/bin/sh

# Exit immediately on errors
set -e

JOBS=`nproc`
CROSS_COMPILE=$PWD/output/toolchain/bin/riscv64-buildroot-linux-gnu-

ROOTS_OUT=$PWD/output/rootfs.cpio
KERNEL_OUT=$PWD/output/vmlinux.bin
SBI_OUT=$PWD/output/fw_payload.elf
ROOTFS_OVERLAY=$PWD/rootfs_overlay
