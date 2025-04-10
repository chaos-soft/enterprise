{ config, pkgs, lib, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" "mitigations=off" "amd_pstate=guided" ];

  nixpkgs.overlays = [
    (final: prev: {
      yb = prev.yandex-browser.overrideAttrs (old: {
        src = prev.fetchurl {
          url = "http://repo.yandex.ru/yandex-browser/deb/pool/main/y/yandex-browser-stable/yandex-browser-stable_24.12.1.712-1_amd64.deb";
          hash = "sha256-HVkyTw02xgCPQyo/RuAsJvO2kdzjm9R9Q35nJAuUbEc=";
        };
      });
      yandex-browser-overlays = final.yb;
    })
  ];

  environment = {
    etc."rofi.rasi".text = ''
      @theme "${pkgs.rofi}/share/rofi/themes/Arc-Dark.rasi"
    '';
    sessionVariables = {
      PATH = [
        "$HOME/Documents/enterprise/scripts"
        "$HOME/Documents/python/tools"
        "$HOME/node_modules/.bin"
      ];
      DXVK_LOG_LEVEL = "none";
      DXVK_STATE_CACHE_PATH = "/home/chaos/.cache/dxvk";
      EDITOR = "nano";
      GSK_RENDERER = "ngl";
      MANGOHUD_CONFIGFILE = "/home/chaos/tmp/mh";
      MESA_VK_WSI_PRESENT_MODE = "mailbox";
      PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers}";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      RADV_TEX_ANISO = "16";
      VKBASALT_CONFIG_FILE = "/home/chaos/tmp/vkBasalt.conf";
      VKD3D_CONFIG = "no_upload_hvv";
      VKD3D_DEBUG = "none";
    };
    systemPackages = with pkgs; [
      (nginx.override { modules = [ nginxModules.rtmp ]; })
      alsa-utils
      android-tools
      appimage-run
      blender-hip
      calf
      certbot
      curl
      docker-compose
      evtest
      ffmpeg
      ffmpegthumbnailer
      freetube
      git
      gitg
      gnome-disk-utility
      gnome-tweaks
      godot_4
      gparted
      gthumb
      imagemagick
      lsp-plugins
      mangohud
      mate.caja
      mc
      mednaffe
      minetest
      mpv
      nano
      nautilus
      networkmanagerapplet
      nmap
      nodejs_23
      nordic
      obs-studio
      openmw
      p7zip
      pavucontrol
      pipewire.jack
      playwright-driver.browsers
      polkit_gnome
      python312
      python312Packages.flake8
      python312Packages.mypy
      ranger
      sublime4
      telegram-desktop
      tor-browser
      unrar
      usbutils
      vkbasalt
      vulkan-tools
      wireplumber
      x42-plugins
      yandex-browser-overlays
      yt-dlp

      carla
      libsForQt5.qt5ct

      kdePackages.qt6ct
      qtractor
      transmission_4-qt6

      feh
      grim
      picom-pijulius
      rofi

      xdotool
      xorg.xev
      xorg.xinput
      xorg.xrandr

      (wrapOBS {
        plugins = with obs-studio-plugins; [
          obs-vkcapture
        ];
      })
    ];
    xfce.excludePackages = [ pkgs.xfce.mousepad ];
  };

  fileSystems = {
    "/".options = [ "defaults" "noatime" ];
    "/mnt/alisa" = { device = "/dev/disk/by-label/alisa"; fsType = "ext4"; options = [ "defaults" "noatime" "nofail" ]; };
    "/mnt/larka" = { device = "/dev/disk/by-label/larka"; fsType = "ext4"; options = [ "defaults" "noatime" "nofail" ]; };
    "/mnt/xxx1" = { device = "/dev/disk/by-label/xxx1"; fsType = "ext4"; options = [ "defaults" "noatime" "nofail" ]; };
    "/mnt/xxx2" = { device = "/dev/disk/by-label/xxx2"; fsType = "ext4"; options = [ "defaults" "noatime" "nofail" ]; };
  };

  fonts.fontconfig.defaultFonts.monospace = [];
  fonts.fontconfig.defaultFonts.sansSerif = [];
  fonts.fontconfig.subpixel.rgba = "none";

  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  networking = {
    enableIPv6 = false;
    firewall.allowPing = false;
    hostName = lib.mkForce "enterprise";
    nameservers = [ "208.67.222.222" "208.67.220.220" ];
  };

  nixpkgs.config.allowUnfree = true;

  powerManagement.cpuFreqGovernor = "performance";

  programs.corectrl.enable = true;
  programs.firefox.enable = true;
  programs.firejail.enable = true;
  programs.gamemode.enable = true;
  programs.steam.enable = true;
  programs.sway.enable = true;

  services.fstrim.enable = false;
  services.pipewire.jack.enable = true;
  services.printing.enable = lib.mkForce false;
  services.xserver.windowManager.i3.enable = true;

  services.udev.extraHwdb = ''
    evdev:name:SONiX USB Keyboard:*
     KEYBOARD_KEY_70044=volumedown
     KEYBOARD_KEY_70045=volumeup
     KEYBOARD_KEY_70049=rightctrl
     KEYBOARD_KEY_7004b=pagedown
     KEYBOARD_KEY_7004d=pageup
     KEYBOARD_KEY_7004e=end
     KEYBOARD_KEY_700e4=insert

    evdev:name:HID 1d57:ad03 Consumer Control:*
     KEYBOARD_KEY_c00cd=volumeup
     KEYBOARD_KEY_c0223=volumedown

    evdev:name:PixArt OpticalMouse:*
     KEYBOARD_KEY_90004=pagedown
     KEYBOARD_KEY_90005=pageup
  '';

  services.udev.extraRules = ''
    ACTION=="add", ATTRS{idVendor}=="2dc8", ATTRS{idProduct}=="3106", RUN+="${pkgs.kmod}/bin/modprobe xpad", RUN+="${pkgs.bash}/bin/sh -c 'echo 2dc8 3106 > /sys/bus/usb/drivers/xpad/new_id'"
  '';

  users.users.chaos.extraGroups = [ "docker" "wheel" "networkmanager" "corectrl" ];
  users.users.chaos.isNormalUser = true;
  users.users.root.description = lib.mkForce "";

  virtualisation.docker.enable = true;
}
