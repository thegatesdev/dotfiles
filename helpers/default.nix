inputs: let
  mkParts = type: ../parts/${type};
  mkProfile = type: name: ../profiles/${type}/${name};
  mkTheme = type: name: ../themes/${type}/${name};

  nixosParts = mkParts "nixos";
  homeParts = mkParts "home";
in rec {
  mkSystem = {
    name,
    themeName,
    users ? [],
  }: rec {
    profile = mkProfile "nixos" name;
    theme = mkTheme "nixos" themeName;
    nixos = system:
      inputs.nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [nixosParts profile theme];
        specialArgs = {
          inherit system inputs users homeParts;
        };
      };
  };

  mkUser = {
    name,
    themeName,
    description ? "User profile '${name}'",
    groups ? [],
  }: rec {
    inherit description groups;
    profile = mkProfile "home" name;
    theme = mkTheme "home" themeName;
    home = system:
      inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages."${system}";
        modules = [homeParts profile theme];
        extraSpecialArgs = {
          inherit system inputs;
        };
      };
  };
}
