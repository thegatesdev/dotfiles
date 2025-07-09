{
  pkgs,
  inputs,
  system,
  ...
}: let
  extensions = inputs.nix-vscode-extensions.extensions.${system};
in {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    mutableExtensionsDir = false;
    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      userSettings = import ./settings.nix;
      extensions = import ./extensions.nix {
        marketplace = extensions.vscode-marketplace;
      };
    };
  };
}
