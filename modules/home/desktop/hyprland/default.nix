{ inputs, lib, pkgs, ... }:
{
  imports = [
    ./config.nix
    ./swayidle.nix
    ./swaylock.nix
    #./plugins.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
  };
}
