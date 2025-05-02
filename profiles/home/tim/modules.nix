{ helpers, ... }:
{
  imports = builtins.map (helpers.findModule "home") [
    "arandr"
    "autorandr"
    "dunst"
    "firefox"
    "flameshot"
    "gimp"
    "git"
    "gpg"
    "home-manager"
    "i3"
    "keepassxc"
    "kitty"
    "neovim"
    # "polybar"
    "prism-launcher"
    "rofi"
    "thunderbird"
    "udiskie"
    "vesktop"
    "vscode"
  ];
}
