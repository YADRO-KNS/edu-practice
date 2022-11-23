#/bin/sh

. ./config.sh

./qemu_build/qemu-system-riscv64 \
    -smp 4 \
    -machine virt \
    -m 256m \
    -nographic \
    -bios $SBI_OUT \
    -kernel $KERNEL_OUT \
    -initrd $ROOTS_OUT \
    -append "console=ttyS0 earlycon root=/dev/ram0 rw rdinit=/init" \
    -device virtio-net-device,netdev=net \
    -netdev user,id=net,hostfwd=tcp::2345-:2345,hostfwd=tcp::10022-:22 \
    -gdb tcp::1234
