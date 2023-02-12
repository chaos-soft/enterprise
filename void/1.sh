sudo xbps-remove \
    firefox-esr \
    lxdm \
    xfce4

sudo xbps-remove -oO

sudo xbps-install -Su

sudo xbps-install \
    void-repo-multilib \
    void-repo-multilib-nonfree \
    void-repo-nonfree

sudo xbps-install -Su

sudo xbps-install \
    blender \
    breeze \
    calf \
    Carla \
    certbot \
    corectrl \
    cpupower \
    curl \
    docker \
    docker-compose \
    ffmpeg \
    firefox \
    git \
    gitg \
    gnome \
    gnome-tweaks \
    gparted \
    gthumb \
    htop \
    kompare \
    konsole \
    libjack-pipewire \
    MangoHud \
    mc \
    mesa-vulkan-radeon \
    mpv \
    nano \
    nmap \
    nodejs \
    obs \
    pavucontrol \
    pipewire \
    python3-flake8 \
    python3-mypy \
    qt5ct \
    ranger \
    skype \
    steam \
    sublime-text4 \
    torbrowser-launcher \
    transmission-gtk \
    vkBasalt \
    Vulkan-Tools \
    xdotool \
    youtube-dl

sudo xbps-install \
    libdrm-32bit \
    libgcc-32bit \
    libglvnd-32bit \
    libstdc++-32bit \
    MangoHud-32bit \
    mesa-dri-32bit \
    mesa-vulkan-radeon-32bit \
    vkBasalt-32bit

sudo npm install standard --global
