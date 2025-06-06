{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.settings.audio;
in {
  options.settings.audio = {
    enable = mkEnableOption "custom audio settings";
    sof = mkEnableOption "sof firmware package";
    app = mkEnableOption "audio control application";
    tray = mkEnableOption "tray volume control";
  };
  config = mkIf cfg.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    environment.systemPackages = mkMerge [
      (mkIf cfg.sof [pkgs.sof-firmware])
      (mkIf cfg.app [pkgs.pavucontrol])
      (mkIf cfg.tray [pkgs.volctl])
    ];
  };
}
