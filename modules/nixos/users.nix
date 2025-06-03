{
  users,
  lib,
  ...
}: {
  services.userborn.enable = true;

  users.users =
    lib.attrsets.mapAttrs (name: user: {
      isNormalUser = true;
      home = "/home/${name}";
      description = user.description;
      extraGroups = ["wheel" "video" "audio" "networkmanager" "gamemode"];
      initialPassword = name;
    })
    users;
}
