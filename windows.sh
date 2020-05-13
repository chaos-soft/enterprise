cpupower frequency-set -g performance

qemu-system-x86_64 \
    -machine q35,accel=kvm \
    -cpu host,kvm=off,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_time,hv_vendor_id=1234567890ab \
    -smp 6,cores=3,threads=2,sockets=1 \
    -m 8G \
    -rtc clock=host,base=localtime \
    -nodefaults \
    -boot order=dc \
    -drive if=virtio,format=raw,index=0,media=disk,cache=none,file=/dev/xxx \
    -drive index=1,media=cdrom,file=/home/chaos/Downloads/Win10_1909_Russian_x64.iso \
    -drive index=2,media=cdrom,file=/home/chaos/Downloads/virtio-win.iso \
    -device virtio-net,netdev=network0,macaddr=99:89:91:45:8e:9a \
    -netdev tap,id=network0,ifname=tap0,script=no,downscript=no,vhost=on \
    -usb \
    -device usb-host,vendorid=0x046d,productid=0xc24e \
    -device usb-host,vendorid=0x1c4f,productid=0x0026 \
    -device vfio-pci,host=01:00.0,multifunction=on \
    -device vfio-pci,host=01:00.1 \
    -drive if=pflash,format=raw,readonly,file=/run/libvirt/nix-ovmf/OVMF_CODE.fd \
    -drive if=pflash,format=raw,file=/home/chaos/Documents/linux/OVMF_VARS.fd \
    -nographic \

sudo cpupower frequency-set -g powersave

# -device usb-host,vendorid=0x413c,productid=0xa503 \
# -nic user,ipv6=off,model=virtio,macaddr=99:89:91:45:8e:9a,smb=/home/chaos \
