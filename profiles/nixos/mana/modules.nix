{ helpers, ... }:
{
  imports = builtins.map (helpers.findModule "nixos") [
    "clean_defaults"
    "i3"
    "locale"
    "neovim"
    "nix"
    "zsh"
  ];
}
