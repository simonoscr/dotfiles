# Documentation NixOS, Nix Flake, Standalone Home-Manager

## Channel

sudo nix-channel --list

Example output:

home-manager https://github.com/nix-community/home-manager/archive/master.tar.gz
nixos https://nixos.org/channels/nixos-unstable

## Update

### nix

nix-channel --update

### flake

nix flake update

## Build

### NixOS

sudo nixos-rebuild switch --flake .#host

### Home-Manager

home-manager switch --flake .#user@host

## Updating and Build NixOS

sudo nixos-rebuild switch --upgrade --flake .#host

## Programs

### Packages

When you add a package, you're simply making the software available in the user or system environment without additional configuration options provided by modules.

#### NixOS

- environment.systemPackages = with pkgs; [ vim git ];

#### Home-Manager

- home.packages = with pkgs; [ vim git ];

### Modules

When you use a module, you're not just installing the software; you're also configuring it according to the module's options.

#### NixOS

- services.nginx.enable = true;

#### Home-Manager

- programs.git.enable = true;
