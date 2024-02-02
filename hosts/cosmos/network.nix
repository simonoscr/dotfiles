{
  config,
  pkgs,
  ...
}: {
  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      appendNameservers = ["192.168.178.91" "9.9.9.9"];
      insertNameservers = ["192.168.178.91" "9.9.9.9"];
    };
    firewall = {
      enable = true;
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
    };
    nameservers = ["192.168.178.91" "9.9.9.9"];
    #extraHosts = ''
    #'';
  };
  services.resolved.enable = true;

  systemd.services.NetworkManager-wait-online.enable = false;

  services.tailscale = {
    enable = true;
    #useRoutingFeatures = "server";
  };
}
