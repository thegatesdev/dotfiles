{ pkgs, inputs, ... }:
let
  extensions = inputs.nix-vscode-extensions.extensions.${pkgs.system};
in {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;
    mutableExtensionsDir = false;

    userSettings = {
      "window.menuBarVisibility" = "toggle";
      "explorer.confirmDragAndDrop" = false;
      "explorer.confirmDelete" = false;
      "git.confirmSync" = false;
      "git.enableSmartCommit" = true;
      "workbench.iconTheme" = "bearded-icons";
      "workbench.colorTheme" = "Bearded Theme Black & Diamond"; # TODO Move to a nix theme
    };

    extensions = with extensions.open-vsx; [
      # Misc.
      mhutchie.git-graph
      cweijan.vscode-mysql-client2
      # Language support.
      yzhang.markdown-all-in-one
      devsense.phptools-vscode # Check featureset vs intellephense
      devsense.composer-php-vscode
      jnoortheen.nix-ide
      kamadorueda.alejandra
      astro-build.astro-vscode
      ms-python.python
      github.vscode-pull-request-github
      redhat.vscode-yaml
      # Theming.
      beardedbear.beardedicons # TODO Move to a nix theme
      beardedbear.beardedtheme
    ];
  };
}
