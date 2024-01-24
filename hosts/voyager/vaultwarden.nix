{
  config,
  lib,
  pkgs,
  ...
}: {
  services.vaultwarden = {
    enable = true;
    config = {
      DOMAIN = "vaultwarden.local";
      #SIGNUPS_ALLOWED = false;
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;
      #ROCKET_LOG = "critical";

      # This example assumes a mailserver running on localhost,
      # thus without transport encryption.
      # If you use an external mail server, follow:
      #   https://github.com/dani-garcia/vaultwarden/wiki/SMTP-configuration
      #SMTP_HOST = "127.0.0.1";
      #SMTP_PORT = 25;
      #SMTP_SSL = false;

      #SMTP_FROM = "admin@bitwarden.example.com";
      #SMTP_FROM_NAME = "example.com Bitwarden server";
    };
  };

  #security.acme.defaults.email = "acme.scanning268@simplelogin.com";
  #security.acme.acceptTerms = true;

  services.nginx = {
    enable = true;
    #recommendedGzipSettings = true;
    virtualHosts.${config.services.vaultwarden.config.DOMAIN} = {
      #enableACME = true;
      #forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}";
      };
    };
  };
}
