{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.settings.keyring;
in {
  options.settings.keyring = {
    enable = mkEnableOption "keyring support";
    app = mkEnableOption "a graphical secrets app";
  };
  config = mkIf cfg.enable {
    services.gnome.gnome-keyring.enable = true;
    programs.seahorse = mkIf cfg.app {
      enable = true;
    };
    environment.systemPackages = [pkgs.libsecret];
  };
}
