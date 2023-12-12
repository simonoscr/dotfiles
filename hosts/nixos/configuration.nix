############################################################################################
## this is the systems configuration file                                                 ##
## use this to configure the system environment, it replaces /etc/nixos/configuration.nix ##
############################################################################################

{ config, lib, pkgs, inputs, outputs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./hyprland.nix
      ./audio.nix
      ./locale.nix
    ];

  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
    };
  };

  ## systemd-boot
  boot = {
    tmp.cleanOnBoot = true;
    loader = {
      timeout = 2;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_zen;
    initrd.kernelModules = [ "amdgpu" ];
  };

  ## flakes nix
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
    };
  };

  ## networking
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    # firewall
    firewall = {
      enable = true;
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
    };
  };

  ## services
  services = {
    ## xserver
    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      #libinput.enable = true;
    };
    ## printing
    printing = {
      enable = true;
    };
    ## openssh
    openssh = {
      enable = true;
    };
  };

  ## AMD gpu
  hardware = {
    opengl = {
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  ## user
  users.users = {
    simon = {
      initialPassword = "123";
      isNormalUser = true;
      extraGroups = [
        "wheel"
	      "networkmanager"
	      "audio"
	      "video"
      ];
      shell = pkgs.zsh;
    };
  };

  ## packages installed in system profile
  environment.systemPackages = with pkgs; [
    git
    neovim
    curl
    btop
  ];

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

  ### DON'T TOUCH!
  system.stateVersion = "23.11";
}
