{
  pkgs,
  home-manager,
  ...
}: {
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4";
      keybindings = let
        mod = config.modifier;
      in {
        "${mod}+t" = "exec kitty";
        "${mod}+w" = "exec firefox";
        "${mod}+e" = "exec thunar";
        #"${mod}+q" = "exec dmenu_run";
        "${mod}+Shift+e" = "kill";

        "${mod}+j" = "focus left";
        "${mod}+k" = "focus down";
        "${mod}+l" = "focus up";
        "${mod}+semicolon" = "focus right";
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";
        "${mod}+Shift+j" = "move left";
        "${mod}+Shift+k" = "move down";
        "${mod}+Shift+l" = "move up";
        "${mod}+Shift+semicolon" = "move right";
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";
        "${mod}+Ctrl+Left" = "resize grow left";
        "${mod}+Ctrl+Down" = "resize grow down";
        "${mod}+Ctrl+Up" = "resize grow up";
        "${mod}+Ctrl+Right" = "resize grow right";
        "${mod}+h" = "split h";
        "${mod}+v" = "split v";
        "${mod}+f" = "fullscreen";
        "${mod}+Shift+s" = "layout stacking";
        "${mod}+Shift+t" = "layout tabbed";
        "${mod}+Shift+g" = "sticky toggle";
        "${mod}+Shift+f" = "floating toggle";
        "${mod}+space" = "focus mode_toggle";
        "${mod}+Ctrl+greater" = "move workspace to output right";
        "${mod}+Ctrl+less" = "move workspace to output left";
        "${mod}+Shift+r" = "restart";

        "XF86AudioRaiseVolume" = "exec ${pulseaudio}/bin/pactl set-sink-volume 0 +5%";
        "XF86AudioLowerVolume" = "exec ${pulseaudio}/bin/pactl set-sink-volume 0 -5%";
        "XF86AudioMute" = "exec ${pulseaudio}/bin/pactl set-sink-mute 0 toggle";

        "XF86MonBrightnessUp" = "exec ${pkgs.xorg.xbacklight}/bin/xbacklight -inc 5";
        "XF86MonBrightnessDown" = "exec ${pkgs.xorg.xbacklight}/bin/xbacklight -dec 5";

        "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play";
        "XF86AudioPause" = "exec ${pkgs.playerctl}/bin/playerctl pause";
        "XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
        "XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";
      };
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
