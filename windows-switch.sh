#!/bin/bash

xrandr --output DP-4 --off
xrandr --output DVI-D-0 --off
cp /usr/share/edk2.git/ovmf-x64/OVMF_VARS-pure-efi.fd /tmp/my_vars.fd
QEMU_PA_SAMPLES=128 QEMU_AUDIO_DRV=pa
qemu-system-x86_64 \
  -enable-kvm \
  -m 8196 \
  -smp cores=4,threads=2 \
  -cpu host,kvm=off \
  -vga none \
  -soundhw hda \
  -usb -usbdevice host:1b1c:1b09 -usbdevice host:046d:c07d \
  -device vfio-pci,host=02:00.0,multifunction=on \
  -device vfio-pci,host=02:00.1 \
  -drive if=pflash,format=raw,readonly,file=/usr/share/edk2.git/ovmf-x64/OVMF_CODE-pure-efi.fd \
  -drive if=pflash,format=raw,file=/tmp/my_vars.fd \
  -device virtio-scsi-pci,id=scsi \
  -drive file=/home/eltimablo/win.img,id=disk,format=qcow2,if=none,cache=writeback -device scsi-hd,drive=disk
xrandr --output DP-4 --mode "2560x1440" --rate 60 --left-of DVI-D-0
xrandr --output DVI-D-0 --mode "1920x1080" --rate 60 --right-of DP-4
