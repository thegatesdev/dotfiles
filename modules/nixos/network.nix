{
  networking = {
    useDHCP = false;
    dhcpcd.enable = false;

    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };

    nameservers = [
      "2a07:e340::5"
      "194.242.2.5"
    ];
  };
  services.resolved = {
    enable = true;
    dnsovertls = "true";
    dnssec = "false";
    domains = ["~."];
  };
  settings.users.groups = ["networkmanager"];
}
