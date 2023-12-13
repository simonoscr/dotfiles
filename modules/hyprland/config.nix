{ config, default, ... }:
{
  home = {
    sessionVariables = {
      GDK_BACKEND = "wayland,x11";
      QT_QPA_PLATFORM = "wayland;xcb";
      SLD_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";

      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
    };
  };

  wayland.windowManager.hyprland = {
    systemd.enable = true;
    xwayland.enable = true;

    settings = {
      exec-once = [
        "ags -b hypr"
	      "easyeffects --gapplication-service"
	      "steam -silent"
	      "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
      ];

      monitor = [
        "DP-1, 3440x1440@165, 0x0, 1"
      ];

      misc = {
        force_default_wallpaper = 0;
      };

      input = {
	      kb_layout = "de";
        follow_mouse = 2;
	      accel_profile = "flat";
        sensitivity = 0;
      };

      general = {
        gaps_in = 4;
	      gaps_out = 15;
	      border_size = 2;
	      layout = "dwindle";
	      allow_tearing = true;
	      resize_on_border = true;
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
	        new_optimizations = "on";
          size = 3;
          passes = 1;
        };
        drop_shadow = "yes";
        shadow_range = 4;
        shadow_render_power = 3;
      };

      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
	        "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
	      ];
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_is_master = true;
      };

      gestures = {
        workspace_swipe = "off";
      };

      windowrule =
      let
        f = regex: "float, ^(${regex})$";
      in [
	      (f "steam")
	      (f "webcord")
	      (f "pavucontrol")
	      (f "com.github.Aylur.ags")
	      (f "bitwarden")
	      "immediate, class:^(cs2)$"
	      "stayfocused, title:^()$, class:^(steam)$"
      ];

      bind =
      let
        binding = mod: cmd: key: arg: "${mod}, ${key}, ${cmd}, ${arg}";
        mvfocus = binding "SUPER" "movefocus";
        ws = binding "SUPER" "workspace";
        resizeactive = binding "SUPER CTRL" "resizeactive";
        mvactive = binding "SUPER ALT" "moveactive";
        mvtows = binding "SUPER SHIFT" "movetoworkspace";
        e = "exec, ags -b hypr";
        arr = [1 2 3 4 5 6 7 8 9];
      in [
        "ALT, Space,     ${e} -t applauncher"
        "SUPER, Tab,     ${e} -t overview"
        ",Print,         ${e} -r 'recorder.screenshot()'"
        "SHIFT,Print,    ${e} -r 'recorder.screenshot(true)'"
        "SUPER, W, exec, firefox"
	      "SUPER, T, exec, kitty"
        "ALT, Tab, focuscurrentorlast"
        "SUPER SHIFT, E, exit"
        "SUPER SHIFT, Q, killactive"
        "SUPER, V, togglefloating"
        "SUPER, F, fullscreen"
        "SUPER, O, fakefullscreen"
        "SUPER, J, togglesplit"
	      "SUPER, P, pseudo"
        "SUPER, B, exec, firefox"

        (mvfocus "u" "u")
        (mvfocus "d" "d")
        (mvfocus "r" "r")
        (mvfocus "l" "l")
        (ws "left" "e-1")
        (ws "right" "e+1")
        (mvtows "left" "e-1")
        (mvtows "right" "e+1")
        (resizeactive "k" "0 -20")
        (resizeactive "j" "0 20")
        (resizeactive "l" "20 0")
        (resizeactive "h" "-20 0")
        (mvactive "k" "0 -20")
        (mvactive "j" "0 20")
        (mvactive "l" "20 0")
        (mvactive "h" "-20 0")
      ]
      ++ (map (i: ws (toString i) (toString i)) arr)
      ++ (map (i: mvtows (toString i) (toString i)) arr);

      bindle = let e = "exec, ags -b hypr -r"; in [
        ",XF86AudioRaiseVolume,  ${e} 'audio.speaker.volume += 0.05; indicator.speaker()'"
        ",XF86AudioLowerVolume,  ${e} 'audio.speaker.volume -= 0.05; indicator.speaker()'"
	      ",XF86AudioMute,  ${e} 'audio.speaker.volume = 0; indicator.speaker(); audio.speaker.volume = 1; indicator.speaker()'"
      ];

      bindm = [
        "SUPER, mouse:273, resizewindow"
        "SUPER, mouse:272, movewindow"
      ];
    };
    extraConfig = ''
      env = WLR_DRM_NO_ATOMIC,1
    '';
  };
}
