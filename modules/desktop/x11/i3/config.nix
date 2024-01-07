{
  pkgs,
  home-manager,
  ...
}: let
  mod = "Mod4";
in {
  xsession.windowManager.i3 = {
    config = {
      modifier = mod;

      keybindings = {
        # Focus
        "${mod}+left" = "focus left";
        "${mod}+down" = "focus down";
        "${mod}+up" = "focus up";
        "${mod}+right" = "focus right";
      };

      bars = [
        {
          position = "top";
        }
      ];

      terminal = ["kitty"];
    };
  };
  fonts.fontconfig.enable = true;
}
