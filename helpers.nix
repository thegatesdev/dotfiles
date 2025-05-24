let
  defaultSystem = "x86_64-linux";
  buildModules = type: profile: [
    ./modules/${type}
    ./profiles/${type}/${profile}
  ];
in {
  buildNixos = {
    inputs,
    profile,
    system ? defaultSystem,
  }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules = buildModules "nixos" profile;
      specialArgs = {
        inherit inputs;
      };
    };

  buildHome = {
    inputs,
    profile,
    system ? defaultSystem,
    pkgs ? inputs.nixpkgs.legacyPackages."${system}",
  }:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = buildModules "home" profile;
      extraSpecialArgs = {
        inherit inputs;
      };
    };
}
