apm install \
    auto-detect-indentation \
    duplicate-removal \
    intentions@2.0.0 \
    linter-flake8 \
    linter-js-standard \
    linter-mypy \
    sort-lines \
    split-diff
mkdir -p ~/.config/fontconfig
mkdir -p ~/.config/gtk-3.0
mkdir -p ~/.config/MangoHud
mkdir -p ~/.themes/xxx/gnome-shell
mkdir -p ~/Documents/python/flake8
rm ~/.atom/config.cson
rm ~/.atom/styles.less
rm ~/.bash_history
rm ~/.config/corectrl/profiles/_global_.ccpro
rm ~/.config/fontconfig/fonts.conf
rm ~/.config/gtk-3.0/gtk.css
rm ~/.config/MangoHud/MangoHud.conf
rm ~/.local/share/fonts
rm ~/.mozilla/firefox/2mzasvu7.default/chrome/firefox-gnome-theme/customChrome.css
rm ~/.mozilla/firefox/2mzasvu7.default/user.js
rm ~/.themes/xxx/gnome-shell/gnome-shell.css
cp -rp ~/Documents/enterprise/atom/config.cson ~/.atom
ln -s ~/Documents/_global_.ccpro ~/.config/corectrl/profiles
ln -s ~/Documents/enterprise/.bash_history ~
ln -s ~/Documents/enterprise/atom/styles.less ~/.atom
ln -s ~/Documents/enterprise/firefox/customChrome.css ~/.mozilla/firefox/2mzasvu7.default/chrome/firefox-gnome-theme
ln -s ~/Documents/enterprise/firefox/user.js ~/.mozilla/firefox/2mzasvu7.default
ln -s ~/Documents/enterprise/fonts.conf ~/.config/fontconfig
ln -s ~/Documents/enterprise/gnome/gnome-shell.css ~/.themes/xxx/gnome-shell
ln -s ~/Documents/enterprise/gnome/gtk.css ~/.config/gtk-3.0
ln -s ~/Documents/enterprise/MangoHud.conf ~/.config/MangoHud
ln -s ~/Documents/fonts ~/.local/share
dconf reset -f /
dconf load / < ~/Documents/enterprise/gnome/dconf
python3 -m venv ~/Documents/python/flake8
~/Documents/python/flake8/bin/pip install --no-cache-dir flake8 flake8-docstrings mypy
