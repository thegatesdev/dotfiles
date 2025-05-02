let
  defaultSystem = "x86_64-linux";

  helpers = rec {
    findModule = type: name: ./. + "/modules/${type}/${name}";
    findProfile = type: name: ./. + "/profiles/${type}/${name}";
    findTheme = type: name: ./. + "/themes/${name}/${type}.nix";

    buildNixos =
      {
        inputs,
        profile,
        system ? defaultSystem,
        extraModules ? [ ],
      }:
      inputs.nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ (findProfile "nixos" profile) ] ++ extraModules;
        specialArgs = {
          inherit inputs;
          inherit helpers;
        };
      };

    buildHome =
      {
        inputs,
        profile,
        system ? defaultSystem,
        extraModules ? [ ],
      }:
      inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages."${system}";
        modules = [ (findProfile "home" profile) ] ++ extraModules;
        extraSpecialArgs = {
          inherit inputs;
          inherit helpers;
        };
      };
  };
in
{
  inherit (helpers) buildNixos buildHome;
}
