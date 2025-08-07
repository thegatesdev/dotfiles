inputs: let
  mkParts = type: ../parts/${type};
  mkProfile = type: name: ../profiles/${type}/${name};
  mkTheme = type: name: ../themes/${type}/${name};

  nixosParts = mkParts "nixos";
  homeParts = mkParts "home";
in rec {
  mkSystem = args @ {
    profile,
    theme,
    users ? [],
  }: rec {
    profile = mkProfile "nixos" args.profile;
    theme = mkTheme "nixos" args.theme;
    nixos = system:
      inputs.nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [nixosParts profile theme];
        specialArgs = {
          inherit system inputs users homeParts;
        };
      };
  };

  mkUser = args @ {
    profile,
    theme,
    description ? "User profile '${args.profile}'",
    groups ? [],
  }: rec {
    inherit description groups;
    profile = mkProfile "home" args.profile;
    theme = mkTheme "home" args.theme;
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
