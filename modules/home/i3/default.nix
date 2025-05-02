{
  xsession.windowManager.i3 = {
    enable = true;
    extraConfig = builtins.concatStringsSep "\n" [
      (import ./config/var.nix)
      (import ./config/meta.nix)
      (import ./config/windows.nix)
      (import ./config/workspaces.nix)
      (import ./config/display.nix)
      (import ./config/programs.nix)
    ];
  };
}
