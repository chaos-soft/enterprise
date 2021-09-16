apm install \
    auto-detect-indentation \
    duplicate-removal \
    intentions@2.0.0 \
    linter-flake8 \
    linter-js-standard \
    linter-mypy \
    minimap \
    sort-lines \
    split-diff

mkdir -p ~/.config/fontconfig
mkdir -p ~/.config/gtk-3.0
mkdir -p ~/.themes/xxx/gnome-shell
mkdir -p ~/Documents/python/flake8

rm ~/.atom/config.cson
rm ~/.atom/styles.less
rm ~/.bash_history
rm ~/.config/fontconfig/fonts.conf
rm ~/.config/gtk-3.0/gtk.css
rm ~/.local/share/fonts
rm ~/.mozilla/firefox/xxx.default/user.js
rm ~/.themes/xxx/gnome-shell/gnome-shell.css

cp -rp ~/Documents/enterprise/atom/config.cson ~/.atom
ln -s ~/Documents/enterprise/.bash_history ~
ln -s ~/Documents/enterprise/atom/styles.less ~/.atom
ln -s ~/Documents/enterprise/firefox/user.js ~/.mozilla/firefox/xxx.default
ln -s ~/Documents/enterprise/fonts.conf ~/.config/fontconfig
ln -s ~/Documents/enterprise/gnome/gnome-shell.css ~/.themes/xxx/gnome-shell
ln -s ~/Documents/enterprise/gnome/gtk.css ~/.config/gtk-3.0
ln -s ~/Documents/fonts ~/.local/share

python3 -m venv ~/Documents/python/flake8
~/Documents/python/flake8/bin/pip install --no-cache-dir flake8 flake8-docstrings mypy

echo 'dconf' && read -n 1
dconf reset -f /
dconf load / < ~/Documents/enterprise/gnome/dconf
