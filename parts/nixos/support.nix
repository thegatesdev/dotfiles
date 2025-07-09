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
  };
  config = mkIf cfg.swaywm {
    security.polkit.enable = true;
  };
}
