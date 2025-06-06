{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.settings.boot;
in {
  options.settings.boot = {
    silent = mkEnableOption "silent boot";
  };
  config = {
    boot = mkMerge [
      {
        loader = {
          systemd-boot = {
            enable = true;
            consoleMode = "max";
            editor = false;
          };
          efi.canTouchEfiVariables = true;
        };
        initrd.systemd.enable = true;
        kernelPackages = pkgs.linuxKernel.packages.linux_zen;
      }
      (mkIf cfg.silent {
        consoleLogLevel = 0;
        initrd.verbose = false;
        kernelParams = [
          "quiet"
          "boot.shell_on_fail"
          "loglevel=3"
          "rd.systemd.show_status=auto"
          "rd.udev.log_level=3"
          "udev.log_priority=3"
        ];

        loader.timeout = 0;
      })
    ];
  };
}
