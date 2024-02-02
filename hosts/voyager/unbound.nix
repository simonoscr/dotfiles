{pkgs, ...}: {
  services.unbound = {
    enable = true;
    package = pkgs.unbound-full;
    localControlSocketPath = "/run/unbound/unbound.ctl";
    resolveLocalQueries = true;
    settings = {
      server = {
        access-control = [
          "127.0.0.0/8 allow"
          "192.168.0.0/16 allow"
          "::1/128 allow"
        ];
        aggressive-nsec = true;
        cache-max-ttl = 86400;
        cache-min-ttl = 300;
        delay-close = 10000;
        do-ip4 = true;
        do-ip6 = false;
        do-tcp = true;
        do-udp = true;
        edns-buffer-size = "1472";
        extended-statistics = true;
        harden-algo-downgrade = true;
        harden-below-nxdomain = true;
        harden-dnssec-stripped = true;
        harden-glue = true;
        harden-large-queries = true;
        harden-short-bufsize = true;
        qname-minimisation = true;
        so-reuseport = true;
        interface = ["::1" "127.0.0.1" "192.168.178.91"];
        prefetch = "yes";
        prefetch-key = true;
        private-address = [
          "10.0.0.0/8"
          "169.254.0.0/16"
          "172.16.0.0/12"
          "192.168.0.0/16"
          "fd00::/8"
          "fe80::/10"
        ];
        #private-domain = ["oscar"];
        #domain-insecure = ["oscar"];
        local-zone = [
          "'oscar.' static"
        ];
        local-data = [
          "'grafana.oscar IN A 192.168.178.91'"
          "'prometheus.oscar IN A 192.168.178.91'"
          "'loki.oscar IN A 192.168.178.91'"
          "'promtail.oscar IN A 192.168.178.91'"
          "'vaultwarden.oscar IN A 192.168.178.91'"
        ];
      };
    };
  };
  # no need for a systemd-resolved stub
  services.resolved.enable = false;

  # Since we use this for local dns resolving, we don't want to stop/start but
  # just restart, so we quickly get it back.
  systemd.services.unbound.stopIfChanged = false;
}
