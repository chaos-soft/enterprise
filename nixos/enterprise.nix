{ config, pkgs, ... }:

let
  pkgsU = import "/home/chaos/Downloads/nixpkgs" {};
in {
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_5_14;
    kernelParams = [ "nvidia-drm.modeset=1" ];
  };

  environment = {
    systemPackages = with pkgs; [
      (nginx.override { modules = [ pkgs.nginxModules.rtmp ]; })
      atom
      carla
      certbot
      docker-compose
      ffmpeg
      firefox
      firejail
      git
      gitg
      gnome.gnome-tweak-tool
      gparted
      gthumb
      lsp-plugins
      mangohud
      mc
      mpv
      nix-prefetch-github
      nmap
      nordic
      obs-studio
      obs-studio-plugins.obs-nvfbc
      p7zip
      pavucontrol
      pkgsU.qdre
      python39
      qjackctl
      qt5ct
      ranger
      skype
      tilix
      transmission-gtk
      vkBasalt
      vulkan-tools
      xdotool
      youtube-dl
    ];
    variables = {
      # DXVK_HUD = "full";
      DXVK_ASYNC = "1";
      DXVK_LOG_LEVEL = "none";
      ENABLE_VKBASALT = "1";
      GTK_THEME = "Nordic-bluish-accent";
      MANGOHUD = "1";
      MANGOHUD_CONFIGFILE = "/home/chaos/Documents/enterprise/MangoHud.conf";
      VKBASALT_CONFIG_FILE = "/home/chaos/Documents/enterprise/vkBasalt.conf";
      VKD3D_DEBUG = "none";
    };
  };

  fileSystems = {
    "/".options = [ "defaults" "noatime" ];
    "/mnt/polina" = {
      device = "/dev/disk/by-label/polina";
      fsType = "ext4";
      options = [ "defaults" "noatime" ];
    };
  };

  fonts.fontconfig = {
    defaultFonts = {
      monospace = [ "Menlo" ];
      sansSerif = [ ".Lucida Grande UI" "Helvetica Neue" ];
    };
    subpixel.rgba = "none";
  };

  hardware.pulseaudio.package = pkgs.pulseaudioFull;

  networking = {
    defaultGateway = "172.18.22.1";
    enableIPv6 = false;
    firewall.allowPing = false;
    hostName = "enterprise";
    interfaces.enp4s0.ipv4.addresses = [
      { address = "172.18.22.133"; prefixLength = 24; }
    ];
    nameservers = [ "208.67.222.222" "208.67.220.220" ];
    useDHCP = false;
  };

  nixpkgs.config.allowUnfree = true;

  powerManagement.enable = false;

  programs = {
    firejail.enable = true;
    qt5ct.enable = true;
    steam.enable = true;
  };

  qt5.enable = false;

  services = {
    fstrim.enable = true;
    gnome = {
      tracker-miners.enable = false;
      tracker.enable = false;
    };
    jack = {
      alsa.enable = false;
      jackd.enable = true;
    };
    xserver = {
      desktopManager.gnome.enable = true;
      enable = true;
      videoDrivers = [ "nvidia" ];
      windowManager.i3.enable = true;
    };
  };

  time.timeZone = "Europe/Moscow";

  users.users.chaos = {
    extraGroups = [ "docker" "jackaudio" "wheel" ];
    isNormalUser = true;
  };

  virtualisation.docker.enable = true;
}
