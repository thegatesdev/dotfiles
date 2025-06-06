{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.settings.gamemode;
in {
  options.settings.gamemode = {
    enable = mkEnableOption "gamemode support";
  };
  config = mkIf cfg.enable {
    programs.gamemode = {
      enable = true;
      settings.general.inhibit_screensaver = 0;
    };
  };
}
