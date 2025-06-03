{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.alejandra.defaultPackage.${pkgs.system}
  ];
}
