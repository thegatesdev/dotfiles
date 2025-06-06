{
  mkUser,
  mkSystem,
  ...
}: rec {
  users.chill = mkUser {
    name = "chill";
    groups = ["wheel" "video" "audio" "networkmanager" "gamemode"];
  };
  users.work = mkUser {
    name = "work";
    groups = ["wheel" "video" "audio" "networkmanager"];
  };

  systems.pure = mkSystem {
    name = "pure";
    inherit users;
  };
  systems.yume = mkSystem {
    name = "yume";
    inherit users;
  };
}
