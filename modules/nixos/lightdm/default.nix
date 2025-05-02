{
  services.xserver.displayManager.lightdm = {
    enable = true;
    greeters.slick = {
      enable = true;
    };
    extraConfig = ''
      [Seat:*]
      greeter-hide-users=true
      greeter-allow-guest=false
      greeter-show-manual-login=true
      greeter-show-remote-login=false
      allow-guest=false
    '';
  };
}
