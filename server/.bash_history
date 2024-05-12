nano /etc/ssh/sshd_config
systemctl disable bind9
systemctl disable rpcbind
systemctl restart ssh

apt autoremove --purge
apt install `cat ~/tmp/install`
apt update && apt upgrade
docker load -i ~/tmp/miranda.tar.gz
netstat -tulpn
~/python/tools/polina.py rebuild
~/tmp/docker.sh

cd ~/python/miranda/ && docker compose -f dc.playwright.yml up -d
cd ~/python/velvet/ && docker compose -f dc.nginx.yml up -d
