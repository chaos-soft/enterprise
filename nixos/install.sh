sudo mount /dev/disk/by-partlabel/alisa /mnt
sudo mkdir -p /mnt/boot
sudo mount /dev/disk/by-partlabel/boot /mnt/boot
sudo nixos-generate-config --root /mnt
sudo nano /mnt/etc/nixos/configuration.nix
echo 'nixos-install' && read -n 1
sudo nixos-install
