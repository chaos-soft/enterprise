{ config, pkgs, ... }:

let
  # pkgsU = import "/home/chaos/Downloads/nixpkgs" {};
in {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" ];
  };

  environment = {
    systemPackages = with pkgs; [
      (nginx.override { modules = [ pkgs.nginxModules.rtmp ]; })
      # mousai
      # pkgsU.obs-studio
      # pkgsU.obs-vkcapture
      # v4l-utils
      atom
      carla
      certbot
      corectrl
      cpuset
      docker-compose
      ffmpeg
      firefox
      firejail
      geeqie
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
      p7zip
      pavucontrol
      python39
      qjackctl
      qt5ct
      skype
      tilix
      transmission-gtk
      vkBasalt
      xdotool
      youtube-dl
    ];
    variables = {
      # DXVK_HUD = "version,frametimes,fps,pipelines";
      DXVK_ASYNC = "1";
      DXVK_LOG_LEVEL = "none";
      DXVK_STATE_CACHE_PATH = "/mnt/polina/games/caches";
      GTK_THEME = "Adwaita:light";
      MANGOHUD = "1";
      mesa_glthread = "true";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      VKD3D_DEBUG = "none";
    };
  };

  fileSystems = {
    "/mnt/alisa" = {
      device = "/dev/disk/by-label/alisa";
      fsType = "ext4";
    };
    "/mnt/polina" = {
      device = "/dev/disk/by-label/polina";
      fsType = "ext4";
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

  programs.steam.enable = true;

  security = {
    wrappers = {
      ffmpeg = {
        capabilities = "cap_sys_admin+ep";
        source = "${pkgs.ffmpeg}/bin/ffmpeg";
      };
      firejail.source = "${pkgs.firejail}/bin/firejail";
    };
  };

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
    netdata.enable = true;
    xserver = {
      desktopManager.gnome.enable = true;
      displayManager = {
        autoLogin = {
          enable = true;
          user = "chaos";
        };
        gdm.enable = true;
      };
      enable = true;
    };
  };

  time.timeZone = "Europe/Moscow";

  users.users.chaos = {
    extraGroups = [ "docker" "jackaudio" "wheel" ];
    isNormalUser = true;
  };

  virtualisation.docker.enable = true;
}
