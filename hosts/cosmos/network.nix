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
  };
  systemd.services.NetworkManager-wait-online.enable = false;
}
