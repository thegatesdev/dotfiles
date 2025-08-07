{
  pkgs,
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.settings.swaywm;
in {
  options.settings.swaywm = {
    enable = mkEnableOption "the sway window manager";
    fancy = mkEnableOption "swayfx fancy graphics";
  };
  config = mkIf cfg.enable {
    wayland.windowManager.sway = {
      enable = true;
      package = mkIf cfg.enable pkgs.swayfx;
      wrapperFeatures.gtk = true;
      config = {};
    };
  };
}
