{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.settings.swaywm;
in {
  options.settings.swaywm = {
    enable = mkEnableOption "the sway window manager";
  };
  config = mkIf cfg.enable {
    wayland.windowManager.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      # config = import ./config.nix;
    };
  };
}
