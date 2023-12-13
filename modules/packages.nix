{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vscodium
    # hyprland
    wl-clipboard
    swww
    pywal
    xdg-desktop-portal-gtk
  ];
}
