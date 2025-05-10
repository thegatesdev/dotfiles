{ config, lib, ... }:
with lib;
let 
  cfg = config.settings.bluetooth;
in {
  options.settings.bluetooth = {
    enable = mkEnableOption "custom bluetooth settings";
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
    services.blueman.enable = true;
  };
}