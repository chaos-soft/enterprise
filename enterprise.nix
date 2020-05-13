{ config, pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
  };

  environment.systemPackages = with pkgs; [
    gnome3.gnome-tweaks
    gnome3.dconf-editor
    gthumb
    gparted
    firefox
    tilix
    pavucontrol
    redshift
    atom
    git
    mpv
    xdotool
    sequeler
    python3
    docker-compose
    # Uplay не работает со steam-run-native.
    steam-run
    gitg
    hdparm
  ];

  fonts.fontconfig = {
    subpixel.rgba = "none";
    defaultFonts = {
      sansSerif = [ "Helvetica Neue" ];
      monospace = [ "Menlo" ];
    };
  };

  fileSystems = {
    "/mnt/games" = {
      device = "/dev/disk/by-label/games";
      fsType = "ext4";
    };
    "/mnt/larka" = {
      device = "/dev/disk/by-label/larka";
      fsType = "ext4";
    };
  };

  hardware = {
    opengl = {
      driSupport32Bit = true;
      extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
    };
    pulseaudio.support32Bit = true;
  };

  networking = {
    hostName = "enterprise";
    useDHCP = false;
    enableIPv6 = false;
    firewall.allowPing = false;
    interfaces.enp99s0.ipv4.addresses = [
      { address = "172.18.22.133"; prefixLength = 24; }
    ];
    defaultGateway = "172.18.22.1";
    nameservers = [ "77.88.8.8" "77.88.8.1" ];
  };

  nixpkgs.config.allowUnfree = true;

  services = {
    xserver = {
      enable = true;
      desktopManager.gnome3.enable = true;
      windowManager.i3.enable = true;
      videoDrivers = [ "nvidia" ];
      inputClassSections = [ ''
        Identifier "Marble Mouse"
        MatchProduct "Logitech USB Trackball"
        Driver "evdev"
        Option "ButtonMapping" "3 2 1 4 5 6 7 8 9"
        Option "EmulateWheel" "true"
        Option "EmulateWheelButton" "9"
      '' ];
    };
    flatpak.enable = true;
  };

  time.timeZone = "Europe/Moscow";

  users.users.chaos = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
  };

  virtualisation.docker.enable = true;
}
