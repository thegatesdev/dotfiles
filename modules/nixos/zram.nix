{ config, lib, ... }:
with lib;
let
  cfg = config.settings.zram;
in {
  options.settings.zram = {
    enable = mkEnableOption "custom zram settings";
  };
  config = mkIf cfg.enable {
    zramSwap = {
      enable = true;
      algorithm = "zstd";
      priority = 5;
      memoryPercent = 100;
    };
  };
}