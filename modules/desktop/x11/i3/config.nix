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
      bars = [
        {
          position = "top";
        }
      ];

      terminal = "kitty";
    };
  };
  fonts.fontconfig.enable = true;
}
