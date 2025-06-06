let
  timeZone = "Europe/Amsterdam";
  defaultLocale = "en_US.UTF-8";
  unitLocale = "nl_NL.UTF-8";
in {
  time.timeZone = timeZone;
  i18n = {
    inherit defaultLocale;
    extraLocaleSettings = {
      LC_ADDRESS = unitLocale;
      LC_IDENTIFICATION = unitLocale;
      LC_MEASUREMENT = unitLocale;
      LC_MONETARY = unitLocale;
      LC_NAME = unitLocale;
      LC_NUMERIC = unitLocale;
      LC_PAPER = unitLocale;
      LC_TELEPHONE = unitLocale;
      LC_TIME = unitLocale;
    };
  };
  services.xserver.xkb = {
    layout = "us";
    options = "eurosign:e,caps:escape";
  };
}
