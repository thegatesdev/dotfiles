{
  mkUser,
  mkSystem,
  ...
}: rec {
  users.chill = mkUser {
    name = "chill";
    themeName = "relativity";
    groups = ["wheel" "video" "audio" "networkmanager" "gamemode"];
  };
  users.work = mkUser {
    name = "work";
    themeName = "relativity";
    groups = ["wheel" "video" "audio" "networkmanager"];
  };

  systems.pure = mkSystem {
    name = "pure";
    themeName = "relativity";
    inherit users;
  };
  systems.yume = mkSystem {
    name = "yume";
    themeName = "relativity";
    inherit users;
  };
}
