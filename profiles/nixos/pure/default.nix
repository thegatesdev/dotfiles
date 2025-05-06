{
  imports = [
    ./disko.nix
  ];

  settings.zram = {
    enable = true;
    optimizeSwap = true;
  };
}