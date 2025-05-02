{ pkgs, ... }:
{
  home.packages = [ pkgs.vdhcoapp ]; # Don't think it needs to be installed separately? TODO
  programs.firefox = {
    enable = true;
    languagePacks = [ "en-US" "nl" ];
    nativeMessagingHosts = [ pkgs.vdhcoapp ];
  };
}
