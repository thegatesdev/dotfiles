{
  config,
  lib,
  inputs,
  ...
}:
with lib; let
  cfg = config.settings.disk;
in {
  imports = [
    inputs.disko.nixosModules.disko
  ];
  options.settings.disk = {
    enable = mkEnableOption "custom disk configuration";
    main = mkOption {
      type = types.str;
    };
  };
  config = {
    services.fstrim.enable = true;
  };
  config.disko.devices = mkIf cfg.enable {
    disk = {
      main = {
        device = cfg.main;
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "500M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["umask=0077"];
              };
            };
            root = {
              end = "-32G";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
                mountOptions = [
                  "noatime"
                  "commit=60"
                  "data=journal"
                  "journal_async_commit"
                ];
              };
            };
            swap = {
              size = "100%";
              content = {
                type = "swap";
                discardPolicy = "both";
                resumeDevice = true;
                priority = 0;
              };
            };
          };
        };
      };
    };
  };
}
