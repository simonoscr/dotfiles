{
  config,
  pkgs,
  ...
}: {
  services.prometheus = {
    enable = true;
    port = 9001;
    exporters = {
      node = {
        enable = true;
        enabledCollectors = ["systemd"];
        port = 9002;
      };
    };
    scrapeConfigs = [
      {
        job_name = "node-exporter";
        static_configs = [
          {
            targets = ["localhost:${toString config.services.prometheus.exporters.node.port}"];
          }
        ];
      }
    ];
  };
  services.grafana = {
    enable = true;
    settings.server = {
      domain = "grafana.local";
      http_port = 2342;
      http_addr = "0.0.0.0";
    };
    provision = {
      datasources.settings.datasources = [
        {
          name = "Prometheus";
          type = "prometheus";
          uid = "PDOVLC8AT2RK0PW3";
          access = "proxy";
          url = "http://localhost:${toString config.services.prometheus.port}";
          isDefault = true;
          version = 1;
          editable = false;
        }
      ];
      dashboards.settings.providers = [
        {
          name = "system";
          options.path = ./dashboards/node.json;
        }
      ];
    };
  };
  ## nginx reverse proxy
  #services.nginx.virtualHosts.${config.services.grafana.settings.server.domain} = {
  #  locations."/grafana" = {
  #    proxyPass = "http://127.0.0.1:${toString config.services.grafana.settings.server.http_port}";
  #    proxyWebsockets = true;
  #  };
  #};
}
