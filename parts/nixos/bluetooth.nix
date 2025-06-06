{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.settings.bluetooth;
in {
  options.settings.bluetooth = {
    enable = mkEnableOption "custom bluetooth settings";
    app = mkEnableOption "bluetooth control application";
  };
  config = mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };
    services.blueman = mkIf cfg.app {
      enable = true;
    };
  };
}
