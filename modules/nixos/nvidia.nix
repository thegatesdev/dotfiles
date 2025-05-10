{ config, lib, ... }:
with lib;
let 
  cfg = config.settings.nvidia;
in {
  options.settings.nvidia = {
    enable = mkEnableOption "custom nvidia settings";
    sync = mkEnableOption "prime sync";
    offload = mkEnableOption "prime offload";
  };
  config = mkMerge [
    (mkIf cfg.enable {
      nixpkgs.config.cudaSupport = true;
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          nvidia-vaapi-driver
          vaapiVdpau
          libvdpau-va-gl
        ];
      };
      services.xserver.videoDrivers = ["nvidia"];

      hardware.nvidia = {
        modesetting.enable = true;
        open = true;
        nvidiaSettings = true;
        prime = {
          offload = mkIf cfg.offload {
            enable = true;
            enableOffloadCmd = true;
          };
          sync.enable = cfg.sync;
        };
        package = config.boot.kernelPackages.nvidiaPackages.beta;
      };
    })
    (mkIf (!cfg.enable) {
      # https://github.com/NixOS/nixos-hardware/blob/6aabf68429c0a414221d1790945babfb6a0bd068/common/gpu/nvidia/disable.nix
      boot.extraModprobeConfig = ''
        blacklist nouveau
        options nouveau modeset=0
      '';
      services.udev.extraRules = ''
        ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c0330", ATTR{power/control}="auto", ATTR{remove}="1"
        ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c8000", ATTR{power/control}="auto", ATTR{remove}="1"
        ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{power/control}="auto", ATTR{remove}="1"
        ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", ATTR{power/control}="auto", ATTR{remove}="1"
      '';
      boot.blacklistedKernelModules = [ "nouveau" "nvidia" "nvidia_drm" "nvidia_modeset" ];
    })
  ];
}