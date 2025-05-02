{ lib, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    desktopManager.xterm.enable = false; # TODO check default
    windowManager.i3 = {
      enable = true;
    };
  };

  services.displayManager = {
    defaultSession = "none+i3";
  };
}
