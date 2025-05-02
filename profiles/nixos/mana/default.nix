{
  config,
  pkgs,
  helpers,
  modulesPath,
  ...
}:
{
  system.stateVersion = "24.05";

  imports = [
    ./modules.nix
    (helpers.findTheme "nixos" "aikatsu-stars-1")
    (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
  ];

  programs.ssh.setXAuthLocation = false; # Both the ssh package, and the minimal nix config, use mkDefault to set this.
}
