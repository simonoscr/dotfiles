{
  config,
  inputs,
  ...
}: {
  services.kanidm = {
    enableServer = true;
    serverSettings = {
      tls_chain = config.sops.secrets.a2FuaWRtUm9vdENBLmNydA.path;
      tls_key = config.sops.secrets.a2FuaWRtUm9vdENBLmtleQ.path;
      bindaddress = "127.0.0.1:3013";
      origin = "https://kanidm.space";
    };
  };

  services.nginx = {
    virtualHosts."kanidm.space" = {
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:3013";
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
