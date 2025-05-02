{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zsh
  ];

  environment.shells = [ pkgs.zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
}
