{
  config,
  pkgs,
  lib,
  ...
}: {
  environment.etc = {
    "containers/conf.yml" = {
      text = ''
        ---
        # Page meta info, like heading, footer text and nav links
        pageInfo:
          title: Hello, Oscar
          description: NixOS Home-Server Startpage
          logo: https://raw.githubusercontent.com/NixOS/nixos-artwork/a36185b45ec4a9fbef9f43b23c5c3fe36f3feb01/logo/nix-snowflake.svg

        # Optional app settings and configuration
        appConfig:
          statusCheck: true
          theme: minimal-dark
          customCss: '.clock p.time { font-size: 3rem !important; }'
          layout: horizontal
          iconSize: medium

        # Main content - An array of sections, each containing an array of items
        sections:
        - name: Today
          icon: ""
          displayData:
            collapsed: false
            hideForGuests: false
          widgets:
          - type: clock

        - name: Monitoring
          icon: https://www.svgrepo.com/show/427427/general-graph-increase.svg
          items:
          - title: Grafana
            icon: https://www.svgrepo.com/show/353829/grafana.svg
            url: http://grafana.space
            description: Grafana is the open source analytics & monitoring solution.
            tags: [monitoring]
            statusCheckAcceptCodes: '401'
          - title: Prometheus
            icon: https://www.svgrepo.com/show/354219/prometheus.svg
            url: http://prometheus.space
            description: An open-source monitoring system with a dimensional data model, flexible query language, efficient time series database and modern alerting approach.
            tags: [monitoring]
            statusCheckAcceptCodes: '401'
          - title: Loki
            icon: https://grafana.com/static/img/logos/logo-loki.svg
            url: http://loki.space
            description: Loki is a horizontally scalable, highly available, multi-tenant log aggregation system inspired by Prometheus.
            tags: [monitoring]
            statusCheckAcceptCodes: '401'
          - title: Promtail
            icon: https://grafana.com/static/img/logos/logo-loki.svg
            url: http://promtail.space
            description: Promtail is an agent which ships the contents of local logs to a private Grafana Loki instance.
            tags: [monitoring]
            statusCheckAcceptCodes: '401'
          - title: Cockpit
            icon: https://linuxundich.de/wp-content/uploads/2014/12/cockpit-fedora-logo.png
            url: http://cockpit.space
            description: Cockpit is a web-based graphical interface for servers.
            tags: [monitoring]
        - name: Security
          icon: https://www.svgrepo.com/show/427460/general-office-open-padlock.svg
          items:
          - title: Vaultwarden
            icon: https://www.svgrepo.com/show/349309/bitwarden.svg
            url: http://vaultwarden.space
            description: Bitwarden makes it easy for businesses and individuals to securely generate, store, and share passwords from any location, browser, or device.
            tags: [security]
      '';
      mode = "0444";
    };
  };
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
      volumes = ["/etc/containers/conf.yml:/app/public/conf.yml"];
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
