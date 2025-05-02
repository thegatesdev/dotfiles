{
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    # alsa.support32Bit = true; # May be needed for older applications, I suppose?
    pulse.enable = true;
    jack.enable = true; # Jack API
  };
}
