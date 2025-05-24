{
  imports = [
    ./hardware.nix
  ];

  system.stateVersion = "25.05";

  settings = {
    audio = {
      enable = true;
      sof = true;
      app = true;
      tray = true;
    };
    bluetooth = {
      enable = true;
      app = true;
    };
    boot.silent = true;
    disk = {
      enable = true;
      main = "/dev/disk/by-id/placeholder";
    };
    gamemode.enable = true;
    keyring = {
      enable = true;
      app = true;
    };
    light.enable = true;
    nvidia = {
      enable = true;
      sync = true;
    };
    zram = {
      enable = true;
      optimizeSwap = true;
    };
  };
}
