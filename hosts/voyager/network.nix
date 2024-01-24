{
  config,
  pkgs,
  ...
}: {
  networking = {
    hostName = "nixos-server";
    #networkmanager.enable = true;
    wireless.enable = true;
    firewall = {
      enable = true;
      allowPing = true;
      logRefusedConnections = false;
      allowedTCPPorts = [22];
      # allowedUDPPorts = [ ... ];
    };
    #extraHosts = ''
    #'';
  };

  systemd = {
    services = {
      NetworkManager-wait-online.enable = false;
      systemd-networkd.stopIfChanged = false;
      systemd-resolved.stopIfChanged = false;
    };
    network.wait-online.enable = false;
  };

  services.fail2ban.enable = true;
}
