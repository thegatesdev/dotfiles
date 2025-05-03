let
  defaultSystem = "x86_64-linux";
  modulesPath = for: ./modules/${for};
  profilePath = for: name: ./profiles/${for}/${name};
  mkModules = for: profile: [ (modulesPath for) (profilePath for profile) ];
in
{
  buildNixos =
    {
      inputs,
      profile,
      system ? defaultSystem,
      extraModules ? [],
    }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules = (mkModules "nixos" profile) ++ extraModules;
      specialArgs = {
        inherit inputs;
      };
    };
  
  buildHome =
    {
      inputs,
      profile,
      system ? defaultSystem,
      extraModules ? [],
    }:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages."${system}";
      modules = (mkModules "home" profile) ++ extraModules;
      extraSpecialArgs = {
        inherit inputs;
      };
    };
}