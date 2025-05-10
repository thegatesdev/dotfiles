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
}