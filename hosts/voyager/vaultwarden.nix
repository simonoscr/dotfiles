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
      DOMAIN = "http://vaultwarden.space";
      SIGNUPS_ALLOWED = false;
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;
      ROCKET_LOG = "critical";
    };
  };
  # nginx reverse proxy
  services.nginx = {
    enable = true;
    additionalModules = [pkgs.nginxModules.pam];
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
    virtualHosts."vaultwarden.space" = {
      locations."/" = {
        proxyPass = "http://vaultwarden";
        proxyWebsockets = true;
      };
      extraConfig = ''
        auth_pam  "Password Required";
        auth_pam_service_name "nginx";
      '';
      listen = [
        {
          addr = "192.168.178.91";
          port = 80;
        }
      ];
    };
  };
}
