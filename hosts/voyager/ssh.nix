{
  config,
  pkgs,
  inputs,
  ...
}: let
  userhome = config.users.users.oscar.home;
  username = config.users.users.oscar.name;
in {
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
    validateSopsFiles = false;
    defaultSopsFile = "${userhome}/.dotfiles/home/oscar/secrets/secrets.yaml";
    age.sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
    secrets = {
      c3NoLXB1Yi1rZXk = {
        mode = "0600";
        owner = "${username}";
        path = "${userhome}/.ssh/authorized_keys";
      };
      c3NoLXByaXZhdGUta2V5 = {
        mode = "0600";
        owner = "${username}";
        path = "${userhome}/.ssh/id_ed25519";
      };
      V0lGSQ = {
        path = "/etc/wpa_supplicant.conf";
      };
    };
  };
}
