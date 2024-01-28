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
        disabledCollectors = ["btrfs" "mdadm" "selinux" "xfs"];
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

  services.loki = {
    enable = true;
    configuration = {
      server.http_listen_port = 3030;
      auth_enabled = false;

      ingester = {
        lifecycler = {
          address = "127.0.0.1";
          ring = {
            kvstore = {
              store = "inmemory";
            };
            replication_factor = 1;
          };
        };
        chunk_idle_period = "1h";
        max_chunk_age = "1h";
        chunk_target_size = 999999;
        chunk_retain_period = "30s";
        max_transfer_retries = 0;
      };

      schema_config = {
        configs = [
          {
            from = "2022-06-06";
            store = "boltdb-shipper";
            object_store = "filesystem";
            schema = "v12";
            index = {
              prefix = "index_";
              period = "24h";
            };
          }
        ];
      };

      storage_config = {
        boltdb_shipper = {
          active_index_directory = "/var/lib/loki/boltdb-shipper-active";
          cache_location = "/var/lib/loki/boltdb-shipper-cache";
          cache_ttl = "24h";
          shared_store = "filesystem";
        };

        filesystem = {
          directory = "/var/lib/loki/chunks";
        };
      };

      limits_config = {
        reject_old_samples = true;
        reject_old_samples_max_age = "168h";
      };

      chunk_store_config = {
        max_look_back_period = "0s";
      };

      table_manager = {
        retention_deletes_enabled = false;
        retention_period = "0s";
      };

      compactor = {
        working_directory = "/var/lib/loki";
        shared_store = "filesystem";
        compactor_ring = {
          kvstore = {
            store = "inmemory";
          };
        };
      };
    };
  };

  services.promtail = {
    enable = true;
    configuration = {
      server = {
        http_listen_port = 3031;
        grpc_listen_port = 0;
      };
      positions = {
        filename = "/tmp/positions.yaml";
      };
      clients = [
        {
          url = "http://localhost:${toString config.services.loki.configuration.server.http_listen_port}/loki/api/v1/push";
        }
      ];
      scrape_configs = [
        {
          job_name = "journal";
          journal = {
            max_age = "12h";
            labels = {
              job = "systemd-journal";
              host = "pihole";
            };
          };
          relabel_configs = [
            {
              source_labels = ["__journal__systemd_unit"];
              target_label = "unit";
            }
          ];
        }
      ];
    };
  };

  services.grafana = {
    enable = true;
    settings.server = {
      http_port = 2342;
      http_addr = "127.0.0.1";
      domain = "grafana";
      #root_url = "http://XXX.XXX.XXX.XXX:8010";
    };
    provision = {
      enable = true;
      datasources.settings.datasources = [
        {
          name = "Prometheus";
          type = "prometheus";
          uid = "PDOVLC8AT2RK0PW3";
          access = "proxy";
          url = "http://localhost:${toString config.services.prometheus.port}";
          editable = false;
        }
        {
          name = "Loki";
          type = "loki";
          uid = "LD9DH35SKJ65DS3K";
          access = "proxy";
          url = "http://localhost:${toString config.services.loki.configuration.server.http_listen_port}";
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
  #  # nginx reverse proxy
  #  services.nginx = {
  #    enable = true;
  #    recommendedProxySettings = true;
  #    recommendedOptimisation = true;
  #    recommendedGzipSettings = true;
  #    # recommendedTlsSettings = true;
  #
  #    upstreams = {
  #      "grafana" = {
  #        servers = {
  #          "127.0.0.1:${toString config.services.grafana.port}" = {};
  #        };
  #      };
  #      "prometheus" = {
  #        servers = {
  #          "127.0.0.1:${toString config.services.prometheus.port}" = {};
  #        };
  #      };
  #      "loki" = {
  #        servers = {
  #          "127.0.0.1:${toString config.services.loki.configuration.server.http_listen_port}" = {};
  #        };
  #      };
  #      "promtail" = {
  #        servers = {
  #          "127.0.0.1:${toString config.services.promtail.configuration.server.http_listen_port}" = {};
  #        };
  #      };
  #    };
  #
  #    virtualHosts.grafana = {
  #      locations."/" = {
  #        proxyPass = "http://grafana";
  #        proxyWebsockets = true;
  #      };
  #      listen = [
  #        {
  #          addr = "XXX.XXX.XXX.XXX";
  #          port = 8010;
  #        }
  #      ];
  #    };
  #
  #    virtualHosts.prometheus = {
  #      locations."/".proxyPass = "http://prometheus";
  #      listen = [
  #        {
  #          addr = "XXX.XXX.XXX.XXX";
  #          port = 8020;
  #        }
  #      ];
  #    };
  #
  #    # confirm with http://XXX.XXX.XXX.XXX:8030/loki/api/v1/status/buildinfo
  #    #     (or)     /config /metrics /ready
  #    virtualHosts.loki = {
  #      locations."/".proxyPass = "http://loki";
  #      listen = [
  #        {
  #          addr = "XXX.XXX.XXX.XXX";
  #          port = 8030;
  #        }
  #      ];
  #    };
  #
  #    virtualHosts.promtail = {
  #      locations."/".proxyPass = "http://promtail";
  #      listen = [
  #        {
  #          addr = "XXX.XXX.XXX.XXX";
  #          port = 8031;
  #        }
  #      ];
  #    };
  #  };
}
