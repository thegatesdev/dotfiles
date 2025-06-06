{
  inputs,
  defaultSystem,
}: let
  mkParts = type: ../parts/${type};
  mkProfile = type: name: ../profiles/${type}/${name};

  nixosParts = mkParts "nixos";
  homeParts = mkParts "home";
in rec {
  mkSystem = {
    name,
    users ? [],
    system ? defaultSystem,
  }: rec {
    profile = mkProfile "nixos" name;
    nixos = inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [nixosParts profile];
      specialArgs = {
        inherit system inputs users homeParts;
      };
    };
  };

  mkUser = {
    name,
    system ? defaultSystem,
    pkgs ? inputs.nixpkgs.legacyPackages."${system}",
    description ? "User profile '${name}'",
    groups ? [],
  }: rec {
    inherit description groups;
    profile = mkProfile "home" name;
    home = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [homeParts profile];
      extraSpecialArgs = {
        inherit system inputs;
      };
    };
  };
}
