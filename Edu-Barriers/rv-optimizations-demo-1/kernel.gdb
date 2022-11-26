source ../gef/gef.py
add-symbol-file vmlinux
add-symbol-file ../output/fw_payload.elf
source vmlinux-gdb.py
lx-symbols
gef-remote --qemu-user --qemu-binary vmlinux localhost 1234
