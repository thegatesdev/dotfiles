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
    disk = {
      enable = true;
      main = "/dev/nvme0n1";
    };
    gamemode.enable = true;
    keyring = {
      enable = true;
      app = true;
    };
    light.enable = true;
    support.swaywm = true;
    zram = {
      enable = true;
      optimizeSwap = true;
    };
  };
}
