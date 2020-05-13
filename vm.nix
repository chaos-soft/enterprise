{ config, pkgs, ... }:

{
  boot = {
    kernelParams = [ "intel_iommu=on" "iommu=pt" ];
    kernelModules = [ "vfio_pci" "vfio" "vfio_iommu_type1" "vfio_virqfd" ];
    extraModprobeConfig = "options vfio-pci ids=10de:13c2,10de:0fbb";
  };

  virtualisation.libvirtd.enable = true;
}
