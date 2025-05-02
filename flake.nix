{
  description = "TheGatesDev Personal Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    lix-module.url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.0.tar.gz";
    lix-module.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";
    alejandra.url = "github:kamadorueda/alejandra/3.0.0";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs:
    let
      helpers = import ./helpers.nix;
      extraModules = [ inputs.lix-module.nixosModules.default ];
    in
    {
      # - System Bedrock (Home PC)
      nixosConfigurations.bedrock = helpers.buildNixos {
        profile = "bedrock";
        inherit inputs;
        inherit extraModules;
      };
      # - System Mana (Minimal ISO)
      nixosConfigurations.mana = helpers.buildNixos {
        profile = "mana";
        inherit inputs;
        inherit extraModules;
      };

      # - Home Tim (Default home)
      homeConfigurations.tim = helpers.buildHome {
        profile = "tim";
        inherit inputs;
      };
    };
}
