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
      #settings = {
      #  PasswordAuthentication = "false";
      #  KbdInteractiveAuthentication = "false";
      #  AuthorizedKeysFile = "/run/secrets/ssh-pub-key"
      #};
    };
  };
  sops = {
    defaultSopsFile = ../../home/host/secrets/secrets.yaml;
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    secrets.c3NoLXB1Yi1rZXk = {};
    secrets."V0lGSQ/c3NpZA" = {};
    secrets."V0lGSQ/cGtz" = {};
  };
}
