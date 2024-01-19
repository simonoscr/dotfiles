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
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
    };
  };
  systemd.services.NetworkManager-wait-online.enable = false;
}
