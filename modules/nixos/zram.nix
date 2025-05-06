{ config, lib, ... }:
with lib;
let
  cfg = config.settings.zram;
in {
  options.settings.zram = {
    enable = mkEnableOption "custom zram settings";
    optimizeSwap = mkEnableOption "optimized swap parameters";
  };
  config = mkIf cfg.enable {
    zramSwap = {
      enable = true;
      algorithm = "zstd";
      priority = 5;
      memoryPercent = 100;
    };
    boot.kernel.sysctl = mkIf cfg.optimizeSwap {
      "vm.swappiness" = 180;
      "vm.watermark_boost_factor" = 0;
      "vm.watermark_scale_factor" = 125;
      "vm.page-cluster" = 0;
    };
  };
}