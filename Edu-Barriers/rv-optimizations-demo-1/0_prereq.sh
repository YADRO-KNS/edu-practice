#!/bin/sh

. ./config.sh

# Fedora
sudo dnf install ncurses-devel perl-ExtUtils-MakeMaker ninja-build glib2-devel pixman-devel libslirp-devel

git clone -b 2022.08.x git://git.busybox.net/buildroot
git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
cd linux; git checkout v6.0; cd ..
git clone https://github.com/riscv-software-src/opensbi.git
cd opensbi; git checkout v1.1; cd ..
git clone https://github.com/qemu/qemu.git

mkdir -p output
mkdir -p $ROOTFS_OVERLAY
