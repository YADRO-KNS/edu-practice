add-symbol-file vmlinux
add-symbol-file ../output/fw_payload.elf
source vmlinux-gdb.py
lx-symbols
target remote localhost:1234
