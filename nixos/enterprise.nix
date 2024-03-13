{ config, pkgs, ... }:

{
  boot = {
    kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" "mitigations=off" "drm.edid_firmware=edid/edid.bin" ];
  };

  environment = {
    gnome.excludePackages = with pkgs; [
      # gnome.totem
      epiphany
      evolution
      gnome-text-editor
      gnome-tour
      gnome.geary
      gnome.gnome-calendar
      gnome.gnome-maps
      gnome.gnome-music
      gnome.gnome-online-miners
      gnome.gnome-software
      gnome.gnome-weather
      gnome.simple-scan
      gnome.yelp
      loupe
      snapshot
    ];
    sessionVariables = {
      PATH = [
        "$HOME/node_modules/.bin"
        "$HOME/tmp/flake8/bin"
      ];
      QT_QPA_PLATFORMTHEME = "qt5ct";
    };
    systemPackages = with pkgs; [
      # feh
      # lxappearance
      # nordic
      # p7zip
      # protontricks
      # w3m
      # wine
      # winetricks
      android-tools
      blender
      calf
      carla
      certbot
      curl
      docker-compose
      ffmpeg
      git
      gitg
      gnome.gnome-tweaks
      go
      golangci-lint
      gparted
      grim
      gthumb
      imagemagick
      kitty
      libsForQt5.breeze-icons
      libsForQt5.breeze-qt5
      libsForQt5.kompare
      libsForQt5.konsole
      libsForQt5.qt5ct
      lsp-plugins
      mangohud
      mc
      mednaffe
      minetest
      mpv
      nano
      nmap
      nodejs_21
      obs-studio
      pavucontrol
      pipewire.jack
      python312
      ranger
      rofi
      sublime4
      tor-browser
      transmission_4-qt
      unrar
      usbutils
      vkbasalt
      vulkan-tools
      xbindkeys
      xdotool
      xfce.xfce4-screenshooter
      xorg.xev
      xorg.xmodmap
      yt-dlp
      # (
      #   wrapOBS {
      #     plugins = with obs-studio-plugins; [
      #       obs-gstreamer
      #       obs-vaapi
      #       obs-vkcapture
      #     ];
      #   }
      # )
    ];
    variables = {
      DXVK_LOG_LEVEL = "none";
      DXVK_STATE_CACHE_PATH = "/home/chaos/.cache/dxvk";
      ENABLE_VKBASALT = "1";
      MANGOHUD = "1";
      MANGOHUD_CONFIGFILE = "/home/chaos/tmp/mh";
      RADV_TEX_ANISO = "16";
      VKBASALT_CONFIG_FILE = "/home/chaos/tmp/vkBasalt.conf";
      VKD3D_DEBUG = "none";
      WLR_DRM_NO_ATOMIC = "1";
    };
  };

  fileSystems = {
    "/".options = [ "defaults" "noatime" ];
    "/mnt/larka" = {
      device = "/dev/disk/by-label/larka";
      fsType = "ext4";
      options = [ "defaults" "noatime" "nofail" ];
    };
    "/mnt/polina" = {
      device = "/dev/disk/by-label/polina";
      fsType = "ext4";
      options = [ "defaults" "noatime" "nofail" ];
    };
  };

  fonts.fontconfig = {
    defaultFonts = {
      monospace = [ "Menlo" ];
      sansSerif = [ ".Lucida Grande UI" "Helvetica Neue" ];
    };
    subpixel.rgba = "none";
  };

  hardware.firmware = [
    (
      pkgs.runCommand "edid.bin" {} ''
        mkdir -p $out/lib/firmware/edid
        cp ${/home/chaos/tmp/edid.bin} $out/lib/firmware/edid/edid.bin
      ''
    )
  ];

  networking = {
    enableIPv6 = false;
    firewall.allowPing = false;
    hostName = "enterprise";
    nameservers = [ "208.67.222.222" "208.67.220.220" ];
  };

  powerManagement.enable = false;

  programs = {
    # fish.enable = true;
    corectrl.enable = true;
    firefox.enable = true;
    firejail.enable = true;
    steam.enable = true;
    sway.enable = true;
  };

  services = {
    flatpak.enable = true;
    fstrim.enable = true;
    gnome = {
      tracker-miners.enable = false;
      tracker.enable = false;
    };
    udev.extraRules = ''
      ACTION=="add", ATTRS{idVendor}=="2dc8", ATTRS{idProduct}=="3106", RUN+="${pkgs.kmod}/bin/modprobe xpad", RUN+="${pkgs.bash}/bin/sh -c 'echo 2dc8 3106 > /sys/bus/usb/drivers/xpad/new_id'"
    '';
    # xserver = {
    #   desktopManager.xfce = {
    #     enable = true;
    #     noDesktop = true;
    #   };
    #   windowManager.i3.enable = true;
    # };
  };

  users.users.chaos = {
    extraGroups = [ "docker" "wheel" "networkmanager" "corectrl" ];
    isNormalUser = true;
  };

  virtualisation.docker.enable = true;
}
