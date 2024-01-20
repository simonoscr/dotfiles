{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [ inputs.sops-nix.nixosModules.sops ];

  services = {
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";
      };
    };
  };
  sops = {
    defaultSopsFile = ../../home/host/secrets/secrets.yaml;
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    secrets.c3NoLXB1Yi1rZXk = {
      mode = "0440";
      owner = "host";
      path = "$HOME/.ssh/id_ed25519.pub";
    };
    secrets.V0lGSQ = {
      path = "/etc/wpa_supplicant.conf";
    };
  };
}
