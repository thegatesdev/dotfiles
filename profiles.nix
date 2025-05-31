inputs:
with import ./helpers.nix; rec {
  users.chill = buildUser {
    profile = "chill";
    inherit inputs;
  };
  users.work = buildUser {
    profile = "work";
    inherit inputs;
  };

  systems.pure = buildNixos {
    profile = "pure";
    inherit inputs users;
  };
  systems.yume = buildNixos {
    profile = "yume";
    inherit inputs users;
  };
}
