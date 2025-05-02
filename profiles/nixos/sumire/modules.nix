{ helpers, ... }:
{
  imports = builtins.map (helpers.findModule "nixos") [
    "bluetooth"
    "clean_defaults"
    "firewall"
    "flatpak"
    "gamemode"
    "graphics"
    "home-manager"
    "i3"
    "kernel_xanmod"
    "keyring"
    "libreoffice"
    "locale"
    "neovim"
    "nix"
    "pipewire"
    "quickemu"
    "systemd-boot"
    "udisks2"
    "users"
    "zsh"
  ];
}
