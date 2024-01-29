{
  services.unbound = {
    enable = true;
    settings = {
      server = {
        interface = ["::1" "127.0.0.1" "192.168.178.91"];
        prefetch = "yes";
        prefetch-key = true;
        qname-minimisation = true;
        # Too many broken dnssec setups even at big companies such as amazon.
        # Breaks my email setup. Better rely on tls for security.
        val-permissive-mode = "yes";
        local-zone = "'oscar.local' static";
        local-data = "'grafana.oscar.local. IN A 192.168.178.91'";
      };
    };
  };
  # no need for a systemd-resolved stub
  services.resolved.enable = false;

  # Since we use this for local dns resolving, we don't want to stop/start but
  # just restart, so we quickly get it back.
  systemd.services.unbound.stopIfChanged = false;
}
