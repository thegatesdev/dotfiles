{ pkgs, inputs, ... }:
{
  home.packages = [ inputs.alejandra.defaultPackage.${pkgs.system} ];
}