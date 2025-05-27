{
  networking = {
    useDHCP = false;
    dhcpcd.enable = false;

    networkmanager = {
      enable = true;
      dns = "none";
      wifi.powersave = true;
    };

    nameservers = [
      "194.242.2.5"
    ];
  };
  settings.users.groups = ["networkmanager"];
}
