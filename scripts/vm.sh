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
    -drive file=/dev/disk/by-id/ata-CT480BX500SSD1_2124E5AA92F0,if=none,format=raw,discard=unmap,aio=native,cache=none,id=someid \
    -device scsi-hd,drive=someid,bus=scsi0.0 \
    -cdrom /mnt/xxx1/tmp/cachyos-desktop-linux-260426.iso \
    -device e1000,netdev=net0 \
    -netdev user,id=net0,hostfwd=tcp::5555-:22 \
    -usbdevice tablet \
    -drive if=pflash,format=raw,readonly=on,file=/usr/share/edk2/x64/OVMF_CODE.fd \
    -drive if=pflash,format=raw,file=/home/chaos/tmp/OVMF_VARS.fd \
    -vga qxl
