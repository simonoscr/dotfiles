{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./config.nix
    ./swayidle.nix
    ./swaylock.nix
    #./plugins.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  fonts.fontconfig.enable = true;

  systemd.user.sessionVariables = {
    "MOZ_ENABLE_WAYLAND" = "1"; # for firefox to run on wayland
    "MOZ_WEBRENDER" = "1";
  };
}
