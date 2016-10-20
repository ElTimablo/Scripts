#!/bin/bash
qemu-system-x86_64 \
-enable-kvm \
-m 2048 \
-cpu host,kvm=off \
-vga none \
-device vfio-pci,host=00:02.0,multifunction=on \
-drive if=pflash,format=raw,readonly,file=/usr/share/ovmf/x64/ovmf_code_x64.bin
