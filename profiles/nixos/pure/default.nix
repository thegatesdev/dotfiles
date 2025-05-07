{
  imports = [
    ./hardware.nix
    ./disko.nix
  ];

  settings.zram = {
    enable = true;
    optimizeSwap = true;
  };
}