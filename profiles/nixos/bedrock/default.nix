{ config, pkgs, helpers, ... }:
{
  system.stateVersion = "24.05";
  networking.hostName = "bedrock";

  imports = [
    ./hardware.nix
    ./modules.nix
    (helpers.findTheme "nixos" "aikatsu-stars-1")
  ];

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.enableRedistributableFirmware = true;
  hardware.nvidia = {
    open = false; # For some reason this has no default...
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
  hardware.cpu.intel.updateMicrocode = true;
  services.fstrim.enable = true;
  console.earlySetup = true;
}
