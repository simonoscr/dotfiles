{
  config,
  pkgs,
  ...
}: {
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
    };
    nameservers = ["192.168.178.91" "9.9.9.9"];
    #extraHosts = ''
    #'';
  };
  systemd.services.NetworkManager-wait-online.enable = false;

  services.tailscale = {
    enable = true;
    #useRoutingFeatures = "server";
  };
}
