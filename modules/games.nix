{
  default,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gamemode
    goverlay
    teamspeak_client
    #teamspeak5_client
    #lutris
    #bottles
  ];

  programs.mangohud = {
    enable = true;
    enableSessionWide = false;
  };
}
