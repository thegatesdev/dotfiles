{inputs, ...}: let
  extensions = inputs.nix-vscode-extensions.extensions.${system};
in {
  programs.vscode = {
    extensions = with extensions.vscode-marketplace; [
      beardedbear.beardedicons
      beardedbear.beardedtheme
    ];
    userSettings = {
      "workbench.colorTheme" = "Bearded Theme Black & Emerald";
      "workbench.iconTheme" = "bearded-icons";
    };
  };
}
