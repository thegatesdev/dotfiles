{ config, pkgs, helpers, ... }:
{
  system.stateVersion = "24.05";
  networking.hostName = "sumire";

  imports = [
    ./hardware.nix
    ./modules.nix
    # (helpers.findTheme "default")
  ];

  hardware.nvidia.prime = {
    amdgpuBusId = "";
    nvidiaBusId = ""; # TODO also move extra hw settings from ./modules-temp.nix
  };
}
