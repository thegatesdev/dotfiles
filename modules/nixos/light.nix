{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.settings.light;
in {
  options.settings.light = {
    enable = mkEnableOption "custom light settings";
  };
  config = mkIf cfg.enable {
    programs.light = {
      enable = true;
      brightnessKeys = {
        enable = true;
        minBrightness = 0;
        step = 5;
      };
    };
  };
}
