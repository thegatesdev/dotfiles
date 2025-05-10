{ config, lib, ... }:
with lib;
let
  cfg = config.settings.users;
in {
  options.settings.users = {
    groups = mkOption {
      type = with types; listOf str;
      default = [];
    };
  };
  config.users.users = 
  let
    groups = [ "wheel" "video" "audio" ] ++ cfg.groups;
  in {
    work = {
      isNormalUser = true;
      home = "/home/work";
      description = "Work account";
      extraGroups = groups;
      initialPassword = "";
    };
    chill = {
      isNormalUser = true;
      home = "/home/chill";
      description = "Chill account";
      extraGroups = groups;
      initialPassword = "";
    };
  };
}