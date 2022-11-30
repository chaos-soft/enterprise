{ config, pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_5_19;
    kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" "mitigations=off" ];
  };

  environment = {
    systemPackages = with pkgs; [
      calf
      carla
      certbot
      corectrl
      curl
      docker-compose_2
      ffmpeg
      firefox
      git
      gitg
      gnome.gnome-tweaks
      gparted
      gthumb
      libsForQt5.kate
      libsForQt5.kompare
      libsForQt5.konsole
      lsp-plugins
      mangohud
      mc
      mpv
      nano
      nmap
      obs-studio
      pavucontrol
      python311
      ranger
      transmission-gtk
      unrar
      vkBasalt
      vulkan-tools
      xdotool
      xorg.xmodmap
      youtube-dl
    ];
    variables = {
      DXVK_ASYNC = "1";
      DXVK_LOG_LEVEL = "none";
      ENABLE_VKBASALT = "1";
      MANGOHUD = "1";
      MANGOHUD_CONFIGFILE = "/home/chaos/tmp/mh";
      VKBASALT_CONFIG_FILE = "/home/chaos/tmp/vkBasalt.conf";
      VKD3D_DEBUG = "none";
    };
  };

  fileSystems = {
    "/".options = [ "defaults" "noatime" ];
    "/mnt/larka" = {
      device = "/dev/disk/by-label/larka";
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

  hardware.pulseaudio.enable = false;

  networking = {
    enableIPv6 = false;
    firewall.allowPing = false;
    hostName = "enterprise";
    nameservers = [ "208.67.222.222" "208.67.220.220" ];
    useDHCP = false;
  };

  nixpkgs.config.allowUnfree = true;

  powerManagement.enable = false;

  programs = {
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
    pipewire.enable = true;
    pipewire.jack.enable = true;
    pipewire.pulse.enable = true;
    xserver = {
      desktopManager.gnome.enable = true;
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
