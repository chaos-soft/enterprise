echo '\nHISTFILE=~/Documents/enterprise/.bash_history' >> .zshrc
dconf load / < ~/Documents/enterprise/dconf
sudo pamac remove manjaro-gdm-theme manjaro-gnome-assets
sudo pamac install docker jack2 lutris obs-studio
sudo pamac install atom corectrl docker-compose firefox gamemode gitg lsp-plugins mpv netdata pavucontrol qjackctl qt5ct steam-manjaro tilix wine xdotool
apm install auto-detect-indentation duplicate-removal linter-flake8 linter-js-standard linter-mypy sort-lines split-diff
ln -s /home/chaos/Documents/enterprise/.profile /home/chaos/.profile
ln -s /home/chaos/Documents/enterprise/atom/config.cson /home/chaos/.atom/config.cson
ln -s /home/chaos/Documents/enterprise/atom/styles.less /home/chaos/.atom/styles.less
ln -s /home/chaos/Documents/enterprise/fonts /home/chaos/.local/share/fonts
ln -s /home/chaos/Documents/enterprise/user.js /home/chaos/.mozilla/firefox/uimijg75.default-release/user.js
mkdir -p /home/chaos/.config/fontconfig && ln -s /home/chaos/Documents/enterprise/fonts.conf /home/chaos/.config/fontconfig/fonts.conf
mkdir -p /home/chaos/.config/MangoHud && ln -s /home/chaos/Documents/enterprise/MangoHud.conf /home/chaos/.config/MangoHud/MangoHud.conf
sudo nano /etc/default/grub
sudo nano /etc/environment
sudo nano /etc/fstab
sudo nano /etc/ufw/before.rules
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo systemctl enable docker.service
sudo systemctl enable fstrim.timer
sudo systemctl enable netdata.service
sudo ufw enable
sudo usermod -aG docker,realtime chaos
sudo pamac build nginx-rtmp
echo '\ninclude /home/chaos/Documents/stream/nginx.conf;' | sudo tee --append /etc/nginx/nginx.conf
python3 -m venv ~/Documents/python/flake8
~/Documents/python/flake8/bin/pip install --no-cache-dir flake8 flake8-docstrings mypy
