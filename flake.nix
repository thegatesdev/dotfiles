{
  description = "Personal system flake of thegatesdev";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    lix-module.url = "https://git.lix.systems/lix-project/nixos-module/archive/2.93.0.tar.gz";
    lix-module.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    disko.url = "github:nix-community/disko/latest";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    auto-cpufreq.url = "github:AdnanHodzic/auto-cpufreq/master";
    auto-cpufreq.inputs.nixpkgs.follows = "nixpkgs";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs:
    with import ./profiles (import ./helpers {
      inherit inputs;
      defaultSystem = "x86_64-linux";
    }); {
      nixosConfigurations.pure = systems.pure.nixos;
      nixosConfigurations.yume = systems.yume.nixos;
      homeConfigurations.chill = users.chill.home;
      homeConfigurations.work = users.work.home;
    };
}
