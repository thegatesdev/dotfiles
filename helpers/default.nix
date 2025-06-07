inputs: let
  mkParts = type: ../parts/${type};
  mkProfile = type: name: ../profiles/${type}/${name};

  nixosParts = mkParts "nixos";
  homeParts = mkParts "home";
in rec {
  mkSystem = {
    name,
    users ? [],
  }: rec {
    profile = mkProfile "nixos" name;
    nixos = system:
      inputs.nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [nixosParts profile];
        specialArgs = {
          inherit system inputs users homeParts;
        };
      };
  };

  mkUser = {
    name,
    description ? "User profile '${name}'",
    groups ? [],
  }: rec {
    inherit description groups;
    profile = mkProfile "home" name;
    home = system:
      inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages."${system}";
        modules = [homeParts profile];
        extraSpecialArgs = {
          inherit system inputs;
        };
      };
  };
}
