{
  default,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gamemode
    goverlay
    teamspeak_client
    protonup-qt
    lutris
    wineWowPackages.stable
    #wineWowPackages.waylandFull
    winetricks
    #teamspeak5_client
    bottles
    path-of-building
  ];

  programs.mangohud = {
    enable = true;
    enableSessionWide = false;
  };
}
