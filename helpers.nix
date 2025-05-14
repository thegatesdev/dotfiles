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
        inherit profile;
      };
    };
  
  buildHome =
    {
      inputs,
      profile,
      system ? defaultSystem,
      pkgs ? inputs.nixpkgs.legacyPackages."${system}",
      extraModules ? [],
    }:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = (mkModules "home" profile) ++ extraModules;
      extraSpecialArgs = {
        inherit inputs;
        inherit profile;
      };
    };
}