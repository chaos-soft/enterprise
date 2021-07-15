sudo mount /dev/disk/by-label/linux /mnt
sudo mkdir -p /mnt/boot
sudo mount /dev/disk/by-label/BOOT /mnt/boot
sudo nixos-generate-config --root /mnt
sudo nano /mnt/etc/nixos/configuration.nix
sudo nixos-install
