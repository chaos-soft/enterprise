#!/bin/bash
qemu-system-x86_64 \
    -machine q35,accel=kvm \
    -cpu host \
    -smp $(nproc) \
    -m 8G \
    -rtc clock=host,base=localtime \
    -nodefaults \
    -boot order=dc \
    -device virtio-scsi-pci,id=scsi0 \
    -drive file=/dev/disk/by-id/ata-CT480BX500SSD1_2106E4F3F0C1,if=none,format=raw,discard=unmap,aio=native,cache=none,id=someid \
    -device scsi-hd,drive=someid,bus=scsi0.0 \
    -cdrom /home/chaos/Downloads/alt-p11-xfce-20240912-x86_64.iso \
    -device virtio-net,netdev=vmnic \
    -netdev user,id=vmnic \
    -usbdevice tablet \
    -drive if=pflash,format=raw,readonly=on,file=/usr/share/OVMF/x64/OVMF_CODE.fd \
    -drive if=pflash,format=raw,file=/home/chaos/tmp/OVMF_VARS.fd \
    -vga qxl
