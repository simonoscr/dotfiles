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
    "NIXOS_OZONE_WL" = "1";
    "MOZ_ENABLE_WAYLAND" = "1";
    "WLR_NO_HARDWARE_CURSORS" = "1";
  };
}
