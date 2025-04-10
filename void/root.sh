#!/bin/bash
mkdir alisa larka void xxx1 xxx2
udevadm hwdb --update
usermod -aG docker chaos
xbps-reconfigure -f glibc-locales
xbps-reconfigure -f linux6.12

rm /var/service/sshd

ln -s /etc/sv/docker /var/service/
ln -s /etc/sv/zramen /var/service/
