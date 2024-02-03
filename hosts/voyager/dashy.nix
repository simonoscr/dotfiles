{
  config,
  pkgs,
  lib,
  ...
}: {
  virtualisation.oci-containers.containers = {
    dashy = {
      autoStart = true;
      image = "lissy93/dashy:latest";
      #extraOptions = ["--pull=always"];
      #environment = {
      #  "UID" = "1000";
      #  "GID" = "131"; # docker
      #};
      ports = ["4000:80"];
      volumes = ["/var/lib/containers/storage/tmp/my-conf.yml:/app/public/conf.yml"];
    };
  };
  # Nginx reverses proxy
  services.nginx = {
    enable = true;
    upstreams = {
      "dashy" = {
        servers = {
          "127.0.0.1:4000" = {};
        };
      };
    };
    virtualHosts."dashy.space" = {
      locations."/" = {
        proxyPass = "http://dashy";
      };
      listen = [
        {
          addr = "192.168.178.91";
          port = 80;
        }
      ];
    };
  };
}
