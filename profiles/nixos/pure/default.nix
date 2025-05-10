{ config, ... }:
{
  imports = [
    ./hardware.nix
    ./disko.nix
  ];

  settings = {
    boot.silent = true;
    audio = {
      enable = true;
      sof = true;
      app = true;
      tray = true;
    };
    bluetooth.enable = true;
    nvidia = {
      enable = true;
      sync = true;
    };
    zram = {
      enable = true;
      optimizeSwap = true;
    };
  };

  users.users = 
  let
    groups = [ "wheel" "video" "audio" ] ++ config.settings.users.groups;
  in {
    work = {
      isNormalUser = true;
      home = "/home/work";
      description = "Work account";
      extraGroups = groups;
    };
    chill = {
      isNormalUser = true;
      home = "/home/chill";
      description = "Chill account";
      extraGroups = groups;
    };
  };
}