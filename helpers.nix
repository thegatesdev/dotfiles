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
    users ? [],
    system ? defaultSystem,
  }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules = buildModules "nixos" profile;
      specialArgs = {
        inherit inputs users;
      };
    };

  buildUser = {
    inputs,
    profile,
    system ? defaultSystem,
    pkgs ? inputs.nixpkgs.legacyPackages."${system}",
  }: rec {
    modules = buildModules "home" profile;
    home = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs modules;
      extraSpecialArgs = {
        inherit inputs;
      };
    };
  };
}
