{
  config,
  pkgs,
  ...
}: {
  networking = {
    hostName = "home-server";
    #networkmanager.enable = true;
    wireless.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [22 6443];
      # allowedUDPPorts = [ ... ];
    };
  };

  services.fail2ban.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;
}
