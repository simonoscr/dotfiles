############################################################################################
## this is the systems configuration file                                                 ##
## use this to configure the system environment, it replaces /etc/nixos/configuration.nix ##
############################################################################################
{ ... }:
{
  imports = [
    ./core/boot.nix
    ./core/console.nix
    ./core/locale.nix
    ./core/security.nix
    ./core/systemd.nix
    ./core/users.nix
    ./core/zram.nix
    ./hardware
    ./network
    ./nix
    ./pkgs/packages.nix
    ./programs/dconf.nix
    ./programs/git.nix
    ./programs/gnupg.nix
    ./programs/zsh.nix
    ./secrets/sops.nix
    ./services/kubernetes/helm.nix
    ./services/kubernetes/k3s.nix
    ./services/gitlab-runner.nix
    ./services/podman.nix
    ./services/ssh.nix
    ./services/udev.nix
  ];

  ### DON'T TOUCH!
  system.stateVersion = "23.11";
}
