{
  imports = [
    ../pure/disko.nix
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
    gamemode.enable = true;
    keyring = {
      enable = true;
      app = true;
    };
    light.enable = true;
    zram = {
      enable = true;
      optimizeSwap = true;
    };
  };
}