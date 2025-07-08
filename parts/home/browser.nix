{pkgs, ...}:
{
  home.packages = [
    pkgs.vivaldi
    pkgs.chromium-codecs-ffmpeg-extra
  ];
}