{...}: {
  systemd.tmpfiles.rules = [
    "d /configs/pihole/etc 0755 justinlime justinlime -" #The - disables automatic cleanup, so the file wont be removed after a period
    "d /configs/pihole/etc-dnsmasq.d 0755 justinlime justinlime -" #The - disables automatic cleanup, so the file wont be removed after a period
  ];
  virtualisation.oci-containers.containers = {
    pihole = {
      autoStart = true;
      image = "pihole/pihole:latest";
      environment = {
        TZ = "Europe/Berlin";
        REV_SERVER = "true";
        REV_SERVER_TARGET = "192.168.178.1"; # Router IP.
        REV_SERVER_CIDR = "192.168.0.0/16";
        PROXY_LOCATION = "pihole";
        VIRTUAL_HOST = "pihole.space";
        WEBPASSWORD = "hunter2";
      };
      ports = ["53:53" "53:53/udp" "89:80"];
      volumes = [
        "/etc/containers/pihole:/etc/pihole"
        "/etc/containers/dnsmasq.d:/etc/dnsmasq.d"
      ];
      extraOptions = [
        "--cap-add=NET_ADMIN"
        "--dns=127.0.0.1"
        "--dns=9.9.9.9"
        "--label=io.containers.autoupdate=registry"
      ];
    };
  };
  # Nginx reverses proxy
  services.nginx = {
    enable = true;
    upstreams = {
      "pihole" = {
        servers = {
          "127.0.0.1:89" = {};
        };
      };
    };
    virtualHosts."pihole.space" = {
      locations."/" = {
        proxyPass = "http://pihole";
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
