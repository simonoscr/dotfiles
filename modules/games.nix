{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gamescope
    gamemode
    steam
    goverlay
    mangohud
    teamspeak_client
    teamspeak5_client
    #lutris
    #bottles
  ];
}
