{ profile, ... }:
{
  home.username = profile;
  home.homeDirectory = "/home/${profile}";
  home.stateVersion = "24.11";
  
  programs.home-manager.enable = true;
}