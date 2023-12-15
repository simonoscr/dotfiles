{ default, pkgs, ... }:

{
  home.packages = with pkgs; [
    gamemode
    gamescope
    goverlay
    mangohud
    teamspeak_client
    teamspeak5_client
    #lutris
    #bottles
  ];
}
