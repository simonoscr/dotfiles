{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    swww
    pywal
    #gamescope
    webcord-vencord
    element-desktop
    seatd
  ];
}
