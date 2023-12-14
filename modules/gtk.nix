{ pkgs, config, ... }:
{
  home.pointerCursor = {
    package = pkgs.capitaine-cursors;
    name = "Capitaine Cursors";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    font = {
      name = "Roboto";
      package = pkgs.roboto;
    };
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    cursorTheme = {
      name = "Capitaine Cursors";
      package = pkgs.capitaine-cursors;
    };

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk3";
    style.name = "adwaita-dark";
  };
}
