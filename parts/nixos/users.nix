{
  inputs,
  lib,
  users,
  homeParts,
  system,
  ...
}: let
  mkSystemUser = name: user: {
    isNormalUser = true;
    home = "/home/${name}";
    description = user.description;
    extraGroups = user.groups;
    initialPassword = name;
  };
  mkHomeUser = name: user: user.profile;
in {
  imports = [inputs.home-manager.nixosModules.home-manager];

  users.users = lib.attrsets.mapAttrs mkSystemUser users;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit inputs system;
    };
    sharedModules = [homeParts];
    users = lib.attrsets.mapAttrs mkHomeUser users;
  };

  services.userborn.enable = true;
}
