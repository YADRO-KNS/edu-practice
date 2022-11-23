#/bin/sh

. ./config.sh

./output/toolchain/bin/riscv64-linux-gdb -ex 'target remote localhost:1234' --command ./debug.gdb
