sudo mount /dev/disk/by-label/alisa /mnt
sudo mkdir -p /mnt/boot
sudo mount /dev/disk/by-label/BOOT /mnt/boot
sudo nixos-generate-config --root /mnt
sudo nano /mnt/etc/nixos/configuration.nix
echo 'nixos-install' && read -n 1 -s
sudo nixos-install
