{
  config,
  lib,
  pkgs,
  ...
}: {
  services.vaultwarden = {
    enable = true;
    config = {
      #DOMAIN = "https://test.simonoscar.space";
      #SIGNUPS_ALLOWED = false;
      ROCKET_ADDRESS = "0.0.0.0";
      ROCKET_PORT = 8222;
      ROCKET_LOG = "critical";

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

  #services.nginx = {
  #  enable = true;
  #  # Use recommended settings
  #  recommendedGzipSettings = true;
  #  virtualHosts."test.simonoscar.space" = {
  #    enableACME = true;
  #    forceSSL = true;
  #    locations."/" = {
  #      proxyPass = "http://127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}";
  #    };
  #  };
  #};
}
