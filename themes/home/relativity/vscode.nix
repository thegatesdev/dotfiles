{
  inputs,
  system,
  ...
}: let
  extensions = inputs.nix-vscode-extensions.extensions.${system};
in {
  programs.vscode.profiles.default = {
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
