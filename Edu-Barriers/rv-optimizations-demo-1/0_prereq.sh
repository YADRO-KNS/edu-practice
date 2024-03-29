#!/bin/sh

. ./config.sh

[ -z "`grep safe-path ~/.gdbinit`" ] && echo 'Add "set auto-load safe-path /" to your ~/.gdbinit (or limit to this directory)'

# Fedora
#sudo dnf install ncurses-devel perl-ExtUtils-MakeMaker ninja-build glib2-devel pixman-devel libslirp-devel
# Ubuntu
#sudo apt install libncurses-dev libextutils-makemaker-cpanfile-perl ninja-build libglib2.0-dev libpixman-1-dev libslirp-dev

git clone -b 2022.08.x git://git.busybox.net/buildroot
git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
cd linux; git checkout v6.0; cd ..
git clone https://github.com/riscv-software-src/opensbi.git
cd opensbi; git checkout v1.1; cd ..
git clone https://github.com/qemu/qemu.git
git clone https://github.com/hugsy/gef.git

mkdir -p output
mkdir -p $ROOTFS_OVERLAY
