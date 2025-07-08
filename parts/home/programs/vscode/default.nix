{
  pkgs,
  inputs,
  system,
  ...
}: let
  extensions = inputs.nix-vscode-extensions.extensions.${system};
  marketplace = extensions.vscode-marketplace;
in {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    mutableExtensionsDir = false;
    profiles.default = {
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
      userSettings = import ./settings.nix;
      extensions = with marketplace; [
        angular.ng-template
        astro-build.astro-vscode
        activitywatch.aw-watcher-vscode
        # beardedbear.beardedicons
        # beardedbear.beardedtheme
        biomejs.biome
        editorconfig.editorconfig
        emeryao.file-counter
        bierner.markdown-preview-github-styles
        bierner.markdown-emoji
        bierner.markdown-checkbox
        bierner.markdown-yaml-preamble
        bierner.markdown-footnotes
        bierner.markdown-mermaid
        ecmel.vscode-html-css
        davidanson.vscode-markdownlint
        unifiedjs.vscode-mdx
        misodee.vscode-nbt
        jnoortheen.nix-ide
        ziyasal.vscode-open-in-github
        slevesque.shader
        svelte.svelte-vscode
        minecraftcommands.syntax-mcfunction
        albert.tabout
        vitest.explorer
      ];
    };
  };
}
