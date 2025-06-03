inputs:
with import ./helpers.nix; rec {
  inherit sharedHome;

  users.chill = mkUser {
    profile = "chill";
    inherit inputs;
  };
  users.work = mkUser {
    profile = "work";
    inherit inputs;
  };

  systems.pure = mkSystem {
    profile = "pure";
    inherit inputs users;
  };
  systems.yume = mkSystem {
    profile = "yume";
    inherit inputs users;
  };
}
