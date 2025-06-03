{inputs, ...}: {
  imports = [inputs.lix-module.nixosModules.default];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 3d";
    randomizedDelaySec = "10m";
  };
}
