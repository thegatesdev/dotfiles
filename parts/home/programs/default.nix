{pkgs, ...}: {
  imports = [
    ./vscode
  ];

  home.packages = [
    pkgs.vivaldi
    pkgs.chromium-codecs-ffmpeg-extra
  ];
  services = {
    flameshot.enable = true;
  };
  programs = {
    git = {
      enable = true;
      userName  = "thegatesdev";
      userEmail = "69715898+thegatesdev@users.noreply.github.com";
    };
    helix = {
      enable = true;
      defaultEditor = true;
      languages.language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
        }
      ];
    };
  }
}