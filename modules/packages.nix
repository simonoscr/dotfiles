{pkgs, ...}: {
  home.packages = with pkgs; [
    swww
    pywal
    gamescope
  ];
}
