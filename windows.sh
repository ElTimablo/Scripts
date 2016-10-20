#!/bin/bash

xrandr --output HDMI-1 --off
cp /usr/share/edk2.git/ovmf-x64/OVMF_VARS-pure-efi.fd /tmp/my_vars.fd
QEMU_PA_SAMPLES=4096 QEMU_AUDIO_DRV=pa QEMU_AUDIO_TIMER_PERIOD=50
qemu-system-x86_64 \
  -enable-kvm \
  -m 8192 \
  -smp cores=4,threads=2 \
  -cpu host,kvm=off \
  -vga none \
  -soundhw hda	 \
  -usb -usbdevice host:258a:1006 \
  -usbdevice host:22d4:1100 \
  -device vfio-pci,host=01:00.0,multifunction=on \
  -device vfio-pci,host=01:00.1 \
  -drive if=pflash,format=raw,readonly,file=/usr/share/edk2.git/ovmf-x64/OVMF_CODE-pure-efi.fd \
  -drive if=pflash,format=raw,file=/tmp/my_vars.fd \
  -device virtio-scsi-pci,id=scsi \
  -drive file=/home/eltimablo/win.img,id=disk,format=qcow2,if=none,cache=writeback -device scsi-hd,drive=disk \
  -drive file=/home/eltimablo/Images/virtio.iso,id=virtiocd,if=none,format=raw -device ide-cd,bus=ide.1,drive=virtiocd
xrandr --output HDMI-1 --mode "2560x1440" --rate 60 --left-of HDMI-2
xrandr --output HDMI-2 --mode "1920x1080" --rate 60 --right-of HDMI-1
