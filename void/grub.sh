sudo mount /dev/sdc2 /mnt/
sudo mount /dev/sdc1 /mnt/boot/efi/
sudo xchroot /mnt /bin/bash
sudo umount -R /mnt
