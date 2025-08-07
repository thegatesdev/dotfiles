{
  mkUser,
  mkSystem,
  ...
}: rec {
  users.chill = mkUser {
    profile = "chill";
    theme = "relativity";
    groups = ["wheel" "video" "audio" "networkmanager" "gamemode"];
  };
  users.work = mkUser {
    profile = "work";
    theme = "relativity";
    groups = ["wheel" "video" "audio" "networkmanager"];
  };

  systems.pure = mkSystem {
    profile = "pure";
    theme = "relativity";
    inherit users;
  };
  systems.yume = mkSystem {
    profile = "yume";
    theme = "relativity";
    inherit users;
  };
}
