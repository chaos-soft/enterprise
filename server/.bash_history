nano /etc/ssh/sshd_config
systemctl restart ssh
systemctl disable bind9
systemctl disable rpcbind

apt update && apt upgrade
apt autoremove --purge
apt install `cat install`
docker load -i miranda.tar
netstat -tulpn
~/tmp/docker.sh

cd ~/python/miranda/ && docker-compose up -d
cd ~/python/velvet/ && docker-compose -f dc.nginx.yml up -d
