{ helpers, ... }:
{
  home.stateVersion = "24.05";
  home.username = "tim";
  home.homeDirectory = "/home/tim";

  imports = [ 
    ./modules.nix
    # (helpers.findTheme "home" "aikatsu-stars-1")
  ];
}
