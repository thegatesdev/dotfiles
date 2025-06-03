let
  defaultSystem = "x86_64-linux";
  buildModules = type: profile: [
    ./modules/${type}
    ./profiles/${type}/${profile}
  ];
  sharedHome = ./modules/home;
in {
  mkSystem = {
    profile,
    inputs,
    users ? [],
    system ? defaultSystem,
  }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules = buildModules "nixos" profile;
      specialArgs = {
        inherit inputs system users sharedHome;
      };
    };

  mkUser = {
    inputs,
    profile,
    system ? defaultSystem,
    pkgs ? inputs.nixpkgs.legacyPackages."${system}",
    description ? "User profile '${profile}'",
  }: {
    inherit description;
    profile = ./profiles/home/${profile};
    home = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = buildModules "home" profile;
      extraSpecialArgs = {
        inherit inputs system;
      };
    };
  };
}
