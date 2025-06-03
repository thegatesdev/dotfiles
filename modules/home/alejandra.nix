{
  inputs,
  system,
  ...
}: {
  home.packages = [
    inputs.alejandra.defaultPackage.${system}
  ];
}
