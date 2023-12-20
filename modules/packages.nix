{pkgs, ...}: {
  home.packages = with pkgs; [
    # hyprland
    wl-clipboard
    swww
    pywal
    xdg-desktop-portal-gtk
    gamescope
  ];
}
