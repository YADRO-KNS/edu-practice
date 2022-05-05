#!/bin/sh

. ./config.sh

# Fedora
sudo dnf install ncurses-devel perl-ExtUtils-MakeMaker ninja-build glib2-devel pixman-devel

git clone git://git.busybox.net/buildroot
git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
git clone https://github.com/riscv-software-src/opensbi.git
git clone https://github.com/qemu/qemu.git

mkdir -p output
mkdir -p $ROOTFS_OVERLAY
