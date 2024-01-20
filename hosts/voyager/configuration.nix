############################################################################################
## this is the systems configuration file                                                 ##
## use this to configure the system environment, it replaces /etc/nixos/configuration.nix ##
############################################################################################
{
  config,
  lib,
  pkgs,
  inputs,
  outputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./locale.nix
    ./network.nix
    ./packages.nix
    ./services.nix
    ./virtualisation.nix
    ./k3s.nix
    ./ssh.nix
  ];

  security.sudo.execWheelOnly = true;
  environment.defaultPackages = lib.mkForce [];

  ## systemd-boot
  boot = {
    tmp.cleanOnBoot = true;
    loader = {
      timeout = 2;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  console = {
    earlySetup = true;
    font = "Lat2-Terminus16";
    keyMap = "de";
  };

  zramSwap = {
    enable = true;
    memoryPercent = 20;
    swapDevices = 1;
  };

  ## user
  users = {
    groups.simon.gid = 1000;
    users = {
      host = {
        hashedPasswordFile = config.sops.secrets.dXNlcl9wYXNzd29yZA.path;
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "networkmanager"
          "libvirtd"
        ];
        shell = pkgs.zsh;
      };
    };
  };

  ## programs
  programs = {
    zsh = {
      enable = true;
    };
    dconf = {
      enable = true;
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  ## flakes nix
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      allowed-users = ["root" "host"];
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  ### DON'T TOUCH!
  system.stateVersion = "23.11";
}
