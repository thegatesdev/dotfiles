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
      "127.0.0.1"
      "::1"
    ];
  };

  systemd.services.NetworkManager-wait-online.enable = false;

  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      ipv4_servers = true;
      ipv6_servers = true;
      require_dnssec = true;
      require_nolog = true;
      query_log.file = "/var/log/dnscrypt-proxy/query.log";
      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        cache_file = "/var/cache/dnscrypt-proxy/public-resolvers.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      };
      server_names = ["mullvad-extend-doh"];
    };
  };
}
