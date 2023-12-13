{ inputs, lib, pkgs, ... }:
let
  hyprland = inputs.hyprland.packages.${pkgs.system}.hyprland;

in {

  imports = [
    ./config.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland;
  };
}
