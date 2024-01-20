{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.sops-nix.nixosModules.sops];

  services = {
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        challengeResponseAuthentication = false;
        PermitRootLogin = "no";
        X11Forwarding = false;
      };
      extraConfig = ''
        AllowTcpForwarding yes
        AllowAgentForwarding no
        AllowStreamLocalForwarding no
        AuthenticationMethods publickey
      '';
    };
  };
  sops = {
    defaultSopsFile = ../../home/host/secrets/secrets.yaml;
    age.sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
    secrets = {
      c3NoLXB1Yi1rZXk = {
        mode = "0600";
        owner = config.users.users.host.name;
        path = "/home/host/.ssh/authorized_keys";
      };
      c3NoLXByaXZhdGUta2V5 = {
        mode = "0600";
        owner = config.users.users.host.name;
        path = "/home/host/.ssh/id_ed25519";
      };
      V0lGSQ = {
        path = "/etc/wpa_supplicant.conf";
      };
      dXNlcl9wYXNzd29yZA.neededForUsers = true;
    };
  };
}
