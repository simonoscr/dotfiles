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
      #  PasswordAuthentication = "false";
      #  KbdInteractiveAuthentication = "false";
        AuthorizedKeysFile = "/run/secrets/c3NoLXB1Yi1rZXk";
      };
    };
  };
  sops = {
    defaultSopsFile = ../../home/host/secrets/secrets.yaml;
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    secrets.c3NoLXB1Yi1rZXk = {
      mode = "0440";
      owner = "host";
      path = "$HOME/.ssh/id_ed25519";
    };
    secrets."V0lGSQ/c3NpZA" = {
      owner = "host";
    };
    secrets."V0lGSQ/cGtz" = {
      owner = "host";
    };
  };
}
