{
  config,
  pkgs,
  input,
  ...
}: {
  services.cockpit = {
    enable = true;
    port = 9092;
    openFirewall = true;
    settings = {
      WebService = {
        AllowUnencrypted = true;
      };
    };
  };
  # Nginx reverses proxy
  services.nginx = {
    enable = true;
    upstreams = {
      "cockpit" = {
        servers = {
          "127.0.0.1:${toString config.services.cockpit.port}" = {};
        };
      };
    };
    virtualHosts."cockpit.space" = {
      locations."/" = {
        proxyPass = "http://cockpit";
      };
      listen = [
        {
          addr = "192.168.178.91";
          port = 80;
        }
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    cockpit
  ];

  systemd.sockets.cockpit.listenStreams = ["" "${toString config.services.cockpit.port}"];
}
