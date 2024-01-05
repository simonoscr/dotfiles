{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = {
      mainBar = {
        position = "top";
        spacing = 4;
        height = 20;
        layer = "top";
        gtk-layer-shell = true;
        modules-left = ["custom/launcher" "custom/separator" "cpu" "custom/separator" "memory" "custom/separator" "custom/window-name"];
        modules-center = ["hyprland/workspaces"];
        modules-right = ["tray" "custom/separator" "pulseaudio" "custom/separator" "network" "custom/separator" "bluetooth" "custom/separator" "clock" "custom/separator" "custom/power"];

        "hyprland/workspaces" = {
          format = "{icon}";
          all-outputs = true;
          on-click = "activate";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          format-icons = {
            urgent = "";
            active = "";
            default = "";
            #default = "";
          };
        };

        "hyprland/window" = {
          max-length = 200;
          separate-outputs = true;
        };
        "tray" = {
          show-passive-items = true;
          icon-size = 20;
          spacing = 10;
        };
        "clock" = {
          format = "{:%H:%M}";
          format-alt = "{:%b %d %Y}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "cpu" = {
          interval = 10;
          format = "  {}%";
          max-length = 10;
          on-click = "";
        };
        "memory" = {
          interval = 30;
          format = " {}%";
          format-alt = " {used:0.1f}GB";
          max-length = 10;
        };
        "temperature" = {
          thermal-zone = 0;
          interval = 10;
          format = " {temperatureC}°C";
          max-length = 10;
        };

        "network" = {
          format-wifi = "{icon} {essid}";
          format-ethernet = "󰈀 {ifname}: {ipaddr}/{cidr}";
          format-disconnected = "󰤭";
          tooltip-format = "{essid}";
          format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
        };

        "bluetooth" = {
          format = "{icon}";
          format-alt = "{icon}: {status}";
          interval = 30;
          format-icons = {
            enabled = "";
            disabled = "󰂲";
          };
          tooltip-format = "{status}";
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "󰖁";
          format-icons = {
            default = ["" "" "󰕾"];
          };
          on-click = "pamixer -t";
          on-scroll-up = "pamixer -i 1";
          on-scroll-down = "pamixer -d 1";
          on-click-right = "exec pavucontrol";
          tooltip-format = "Volume {volume}%";
        };

        "custom/power" = {
          format = "󰐥";
          on-click = "";
        };

        "custom/separator" = {
          format = " ";
        };

        "custom/window-name" = {
          format = "<b>{}</b>";
          interval = 1;
          exec = "hyprctl activewindow | grep class | awk '{print $2}'";
        };

        "custom/launcher" = {
          format = "󱄅";
          on-click = "rofi -show drun &";
        };
      };
    };
    style = ''
            * {
        min-height: 0;
        font-family: Lexend;
        font-size: 16px;
        font-weight: 500;
      }

      window#waybar {
        transition-property: background-color;
        transition-duration: 0.5s;
        /* background-color: #1e1e2e; */
        /* background-color: #181825; */
        background-color: rgba(24, 24, 37, 0.6);
      }

      window#waybar.hidden {
        opacity: 0.5;
      }

      #workspaces {
        background-color: transparent;
      }

      #workspaces button {
        all: initial;
        min-width: 0;
        box-shadow: inset 0 -3px transparent;
        padding: 2px 10px;
        min-height: 0;
        margin: 4px 4px;
        border-radius: 8px;
        background-color: #181825;
        color: #cdd6f4;
      }

      #workspaces button:hover {
        box-shadow: inherit;
        text-shadow: inherit;
        color: #1e1e2e;
        background-color: #cdd6f4;
      }

      #workspaces button.active {
        color: #1e1e2e;
        background-color: #89b4fa;
      }

      #workspaces button.urgent {
        background-color: #f38ba8;
      }

      #clock,
      #pulseaudio,
      #custom-logo,
      #custom-power,
      #custom-spotify,
      #cpu,
      #tray,
      #memory,
      #window {
        min-height: 0;
        padding: 2px 10px;
        border-radius: 8px;
        margin: 4px 4px;
        background-color: #181825;
      }

      #custom-sep {
        padding: 0px;
        color: #585b70;
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
        color: #89b4fa;
      }

      #clock.date {
        color: #74c7ec;
      }

      #window {
        color: #a6e3a1;
      }

      #pulseaudio {
        color: #b4befe;
      }

      #pulseaudio.muted {
        color: #a6adc8;
      }

      #custom-logo {
        color: #89b4fa;
      }

      #custom-power {
        color: #f38ba8;
        padding-right: 8px;
        font-size: 14px;
      }

      @keyframes blink {
        to {
          background-color: #f38ba8;
          color: #181825;
        }
      }

      tooltip {
        border-radius: 8px;
      }
    '';
  };
}
