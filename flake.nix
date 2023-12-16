{
  description = "simonoscr's flake for nixos and home-manager";

  inputs = {

    # nixos unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
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

  outputs = { self, nixpkgs, home-manager, sops-nix, hyprland, ... }@inputs:

  let
    system = "x86_64-linux";
    commonModules = import ./common;
  in {

    # nixos configuration entrypoint
    # available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      "cosmos" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/cosmos/configuration.nix
          #commonModules
        ];
      };
      #"voyager" = nixpkgs.lib.nixosSystem {
      #  inherit system;
      #  specialArgs = {inherit inputs;};
      #  modules = [
      #    ./hosts/voyager/configuration.nix
      #  ];
      #};
    };

    # standalone home-manager configuration entrypoint
    # available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      # personal user
      "simon@cosmos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {inherit inputs;};
        modules = [
          ./home/simon/home.nix
        ];
      };
      # work user
      "simon@work" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
	      extraSpecialArgs = {inherit inputs;};
	      modules = [
	        ./home/work/home.nix
        ];
      };
    };
  };
}
