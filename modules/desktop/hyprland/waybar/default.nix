{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gtkmm3
    jsoncpp
    "libsigc++"
    fmt
    chrono-date
    spdlog
    libgtk-3-dev
    gobject-introspection
    "libgirepository1.0-dev"
    libpulse
    libnl
    libappindicator-gtk3
    libdbusmenu-gtk3
    libmpdclient
    libsndio
    xkbregistry
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ''
      * {
        min-height: 0;
        font-family:
          JetBrains Mono NL,
          JetBrainsMonoNerd Font;
        font-size: 11px;
        font-weight: 900;
      }

      window#waybar {
        transition-property: background-color;
        transition-duration: 0.5s;
        /* background-color: #1e1e2e; */
        /* background-color: #181825; */
        background-color: rgba(0, 0, 0, 0.7);
      }

      window#waybar.hidden {
        opacity: 0.5;
      }

      #workspaces {
        background: #1e1e1e;
        margin: 2px 1px 3px 1px;
        padding: 0px 0px;
        margin: 5px 5px;
        border-radius: 15px;
        border: 0px;
        font-style: normal;
        opacity: 0.8;
        font-size: 16px;
        color: #ffffff;
      }

      #workspaces button {
        padding: 1px 1px;
        margin: 3px 3px;
        border-radius: 15px;
        border: 0px;
        color: #fff;
        /* background-color: #1e1e1e; */
        background-color: rgba(0, 0, 0, 0.2);
        transition: all 0.2s ease-in-out;
        opacity: 1;
      }

      #workspaces button.active {
        color: #000;
        background: #fff;
        border-radius: 15px;
        min-width: 40px;
        transition: all 0.2s ease-in-out;
        opacity: 1;
      }

      #workspaces button.urgent {
        background-color: #ff441f;
      }

      #clock,
      #pulseaudio,
      #battery,
      #cpu,
      #tray,
      #memory,
      #window {
        padding: 0px 8px;
        margin: 6px 3px;
        color: #e5e5e5;
        border-radius: 20px;
        background-color: #1e1e1e;
      }
      #custom-logo {
        padding: 0px 10px;
      }

      #tray {
        font-size: 10px;
      }

      #custom-sep {
        padding: 0px;
        color: #585b70;
      }

      #custom-spotify.playing {
        color: #a6e3a1;
      }

      window#waybar.empty #window {
        background-color: transparent;
      }

      #cpu {
        color: #94e2d5;
      }

      #memory {
        color: #cba6f7;
      }

      #clock {
        color: #e3e3e3;
      }

      #clock.date {
        color: #e3e3e3;
      }

      #window {
        color: #a6e3a1;
      }

      #pulseaudio {
        color: #fff;
      }

      #pulseaudio.muted {
        color: #ff5b45;
      }

      tooltip {
        border-radius: 8px;
      }
    '';
    settings = [
      {
        layer = "top";
        position = "bottom";
        height = 16;
        spacing = 0;
        exclusive = true;
        gtk-layer-shell = true;
        passthrough = false;
        fixed-center = true;
        modules-left = ["custom/logo" "hyprland/workspaces"];
        modules-right = ["pulseaudio" "clock" "tray"];

        tray = {
          show-passive-items = true;
          spacing = 10;
        };

        clock = {
          format = "<span color='#6bfffd'> </span>{:%I:%M %p}";
          format-alt = "<span color='#ff9854'> </span>{:%a %b %d}";
          tooltip-format = "<big>{:%B %Y}</big>\n<tt><small>{calendar}</small></tt>";
        };

        cpu = {
          format = "  {usage}%";
          tooltip = true;
          interval = 1;
        };

        memory = {
          format = "  {used:0.2f}G";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "  muted";
          format-icons = {
            headphone = " ";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [" " " " " "];
          };
          on-click = "pavucontrol";
        };
        "custom/logo" = {
          format = "";
          tooltip = false;
        };

        "custom/sep" = {
          format = "|";
          tooltip = false;
        };

        "custom/power" = {
          tooltip = false;
          on-click = "wlogout -p layer-shell &";
          format = " ";
        };
      }
    ];
  };
}
