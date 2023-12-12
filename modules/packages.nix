{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vscodium    

    # audio
    easyeffects
      
    # hyprland
    wl-clipboard
    pavucontrol
    playerctl
    pulsemixer
    swww
    pywal
    xdg-desktop-portal-gtk
  ];
}  
