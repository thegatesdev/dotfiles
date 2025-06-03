{modulesPath, ...}:
{
  imports = [ "${modulesPath}/profiles/perlless.nix" ];

  environment.defaultPackages = [];
  documentation.man.enable = false;
  programs.nano.enable = false;
}
