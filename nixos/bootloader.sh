sudo mount /dev/sda2 /mnt
sudo mount /dev/sda1 /mnt/boot
sudo nixos-enter
# NIXOS_INSTALL_BOOTLOADER=1 /nix/var/nix/profiles/system/bin/switch-to-configuration boot
