{ lib, ... }:
with lib;
{
  options.settings.users = {
    groups = mkOption {
      type = with types; listOf str;
      default = [];
    };
  };
}