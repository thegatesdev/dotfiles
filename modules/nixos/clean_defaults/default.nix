{ pkgs, ... }:
{
  programs.nano.enable = false;
  # services.xserver.excludePackages = with pkgs; [ xterm ];
}
