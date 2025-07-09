{pkgs, ...}: {
  home.packages = [
    pkgs.vivaldi
    pkgs.vivaldi-ffmpeg-codecs
    pkgs.gimp3-with-plugins
    pkgs.keepassxc
    pkgs.thunderbird
  ];
  services = {
    flameshot.enable = true;
    dunst.enable = true;
    network-manager-applet.enable = true;
  };
  programs = {
    vesktop.enable = true;
    git = {
      enable = true;
      userName = "thegatesdev";
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
  };
}
