{pkgs, ...}: {
let
  mod = "SUPER";


  xsession.windowManager.i3 = {
    config = {
      modifier = mod;

      fonts = ["FiraCode Mono Font, Roboto"];

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
