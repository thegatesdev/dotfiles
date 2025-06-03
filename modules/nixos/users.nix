{
  inputs,
  lib,
  users,
  sharedHome,
  ...
}: let
  mkSystemUser = name: user: {
    isNormalUser = true;
    home = "/home/${name}";
    description = user.description;
    extraGroups = ["wheel" "video" "audio" "networkmanager" "gamemode"];
    initialPassword = name;
  };
  mkHomeUser = name: user: user.profile;
in {
  imports = [inputs.home-manager.nixosModules.home-manager];

  services.userborn.enable = true;

  users.users = lib.attrsets.mapAttrs mkSystemUser users;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    sharedModules = [sharedHome];
    users = lib.attrsets.mapAttrs mkHomeUser users;
  };
}
