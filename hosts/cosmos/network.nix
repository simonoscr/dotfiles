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
    #extraHosts = ''
    #'';
  };
  systemd.services.NetworkManager-wait-online.enable = false;
}
