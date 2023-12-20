{
  default,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gamemode
    goverlay
    mangohud
    teamspeak_client
    #teamspeak5_client
    #lutris
    #bottles
  ];
}
