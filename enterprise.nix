{ config, pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_5_10;
    kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" ];
  };

  environment = {
    systemPackages = with pkgs; [
      atom
      corectrl
      docker-compose
      firefox
      git
      gitg
      gnome3.gnome-tweaks
      gparted
      gthumb
      mc
      mpv
      pavucontrol
      python3
      qt5ct
      xdotool
    ];
    variables = {
      DXVK_ASYNC = "1";
      # DXVK_HUD = "version,frametimes,fps,pipelines";
      DXVK_LOG_LEVEL = "none";
      DXVK_STATE_CACHE_PATH = "/mnt/larka/games/caches";
      MANGOHUD = "1";
      # Для proton-ge-custom.
      PROTON_USE_D9VK = "1";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      VKD3D_DEBUG = "none";
    };
  };

  fileSystems = {
    "/mnt/larka" = {
      device = "/dev/disk/by-label/larka";
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

  networking = {
    defaultGateway = "172.18.22.1";
    enableIPv6 = false;
    firewall.allowPing = false;
    hostName = "enterprise";
    interfaces.enp9s0.ipv4.addresses = [
      { address = "172.18.22.133"; prefixLength = 24; }
    ];
    nameservers = [ "208.67.222.222" "208.67.220.220" ];
    useDHCP = false;
  };

  nixpkgs.config.allowUnfree = true;

  programs.steam.enable = true;

  services = {
    fstrim.enable = true;
    gnome3 = {
      tracker.enable = false;
      tracker-miners.enable = false;
    };
    netdata.enable = true;
    xserver = {
      desktopManager.gnome3.enable = true;
      displayManager.gdm.enable = true;
      enable = true;
    };
  };

  time.timeZone = "Europe/Moscow";

  users.users.chaos = {
    extraGroups = [ "docker" "wheel" ];
    isNormalUser = true;
  };

  virtualisation.docker.enable = true;
}
