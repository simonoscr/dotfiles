{ lib, pkgs, inputs, system, target, format, virtual, systems, config, ... }:
{

  imports = [
    ./hardware-configuration.nix
  ];

  ## systemd-boot
  boot = {
    tmp.cleanOnBoot = true;
    loader = {
      timeout = 2;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_zen;
    kernel.sysctl = {
      "vm.swappiness" = 20;
    };
    kernelParams = [ ];
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
    };
    gc = {
      automatic = true;
      dates = "23:00";
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
