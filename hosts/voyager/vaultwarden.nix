{
  config,
  lib,
  pkgs,
  ...
}: {
  services.vaultwarden = {
    enable = true;
    backupDir = "/var/backup/vaultwarden";
    config = {
      #DOMAIN = "vaultwarden";
      SIGNUPS_ALLOWED = false;
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;
      ROCKET_LOG = "critical";
    };
  };
  # nginx reverse proxy
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    # recommendedTlsSettings = true;
    upstreams = {
      "vaultwarden" = {
        servers = {
          "127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}" = {};
        };
      };
    };
    virtualHosts.vaultwarden = {
      locations."/" = {
        proxyPass = "http://vaultwarden";
        proxyWebsockets = true;
      };
      listen = [
        {
          addr = "192.168.178.91";
          port = 8022;
        }
      ];
    };
  };
  networking.firewall.allowedTCPPorts = [8022];
}
