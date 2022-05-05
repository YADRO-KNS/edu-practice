#!/bin/sh

. ./config.sh

cd opensbi
git clean -fdx
make CROSS_COMPILE=$CROSS_COMPILE PLATFORM=generic FW_PAYLOAD_PATH=$KERNEL_OUT V=1 -j$JOBS -s
cp build/platform/generic/firmware/fw_payload.elf $SBI_OUT
