{
  description = "simonoscr's snowball flake for nixos and home-manager";

  inputs = {

    # nixos unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";

    # pre-commit-hook
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nur nix user repository
    nur = {
      url = github:nix-community/NUR;
    };

		# snowfall lib and flake
		snowfall-lib = {
			url = "github:snowfallorg/lib";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		snowfall-flake = {
			url = "github:snowfallorg/flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};

    # nix neovim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.pre-commit-hooks.follows = "pre-commit-hooks";
    };

    # secrets operations nix
    sops-nix = {
      url = "github:Mic92/sops-nix";
    };

    # wayland window manager
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    # aylur-gtk-shell
    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # utils for nix flake
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = inputs:

    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      src = ./.;
    };
