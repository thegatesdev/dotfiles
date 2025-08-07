{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.settings.support;
in {
  options.settings.support = {
    swaywm = mkEnableOption "swaywm support";
    i3wm = mkEnableOption "i3wm support";
  };
  config = mkMerge [
    (mkIf cfg.swaywm {
      security.polkit.enable = true;
    })
    (mkIf cfg.i3wm {
      services.xserver = {
        enable = true;
        windowManager.i3.enable = true;
      };
      services.displayManager = {
        defaultSession = "none+i3";
      };
    })
  ];
}
