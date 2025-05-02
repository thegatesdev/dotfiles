{
  networking.useDHCP = false;

  systemd.network = {
    enable = true;
    networks = {
      "90-interfaces" = {
        matchConfig = { Name = "*"; };
	DHCP = "yes";
      };
    };
  };
}
