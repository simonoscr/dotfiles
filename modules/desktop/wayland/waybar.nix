#
#  Bar
#
{
  config,
  lib,
  pkgs,
  ...
}: let
  modules-left = with config.programs; [
    "custom/menu"
    "custom/spacer"
    "hyprland/workspaces"
    "custom/spacer"
    "cpu"
    "custom/gpu"
    "custom/gpu-temp"
    "memory"
    "disk"
  ];

  modules-center = [
    "clock"
  ];

  modules-right = [
    "tray"
    "custom/spacer"
    "pulseaudio"
    "network"
    "custom/power"
  ];
in {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    systemd = {
      enable = true;
      target = "sway-session.target";
    };

    style = ''
      * {
        border: none;
        border-radius: 5px;
        font-family: FiraCode Nerd Font Mono;
        font-weight: bold;
        font-size: 16px;
        text-shadow: 0px 0px 0px #000000;
      }
      button:hover {
        border: none;
        background-color: rgba(80,100,100,0.4);
      }
      window#waybar {
        /*border: 1px solid #2ec27e;*/
        background-color: rgba(0,0,0,0.5);
        background: transparent;
        transition-property: background-color;
        transition-duration: .5s;
        border-bottom: none;
        border-left: none;
        border-right: none;
      }
      window#waybar.hidden {
        opacity: 0.2;
      }
      #workspace,
      #mode,
      #clock,
      #mpd,
      #memory,
      #window,
      #cpu,
      #custom-cpu,
      #custom-gpu,
      #disk,
      #tray,
      #custom-gpu-temp {
        color: #CCCCCC;
        background-clip: padding-box;
      }
      #custom-spacer {
        color: rgba(204, 204, 204, 0.5);
      }
      #network {
        color: #e66100;
        padding: 0px 5px 0px 5px;
      }
      #pulseaudio {
        color: #f5c211;
        padding: 0px 5px 0px 5px;
      }
      #custom-menu {
        color: #99c1f1;
        padding: 0px 5px 0px 5px;
      }
      #custom-power {
        color: #c01c28;
        padding: 0px 5px 0px 5px;
      }
      #workspaces button {
        padding: 0px 5px;
        min-width: 5px;
        color: rgba(255,255,255,0.8)
      }
      #workspaces button:hover {
        color: #2ec27e;
        background-color: transparent;
      }
      #workspaces button.focused {
        color: #2ec27e;
        background-color: transparent;
      }
      #workspaces button.active {
        color: #2ec27e;
        background-color: transparent;
      }
      #workspaces button.visible {
        color: #2ec27e;
      }
      #workspaces button.hidden {
        color: #999999;
      }
    '';
    settings = {
      Main = {
        layer = "top";
        position = "top";
        height = 14;

        tray = {spacing = 12;};
        modules-left = modules-left;
        modules-right = modules-right;
        modules-center = modules-center;

        "custom/menu" = {
          format = " <span font='28'></span> ";
          on-click = "${pkgs.wofi}/bin/wofi --show drun";
          on-click-right = "${pkgs.wofi}/bin/wofi --show drun";
          tooltip = false;
        };
        "wlr/workspaces" = {
          format = " <span font='16'>{name}</span> ";
          active-only = false;
          on-click = "activate";
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          disable-scroll = true;
          all-outputs = true;
          active-only = false;
          show-special = true;
          on-click = "activate";
          format-icons = {
            active = "<span font='18'></span>";
            default = "<span font='18'></span>";
          };
        };
        clock = {
          format = " {:%b %d %H:%M} ";
          #on-click = "${pkgs.eww-wayland}/bin/eww open --toggle calendar --screen 0";
        };
        cpu = {
          format = "{usage}٪<span font='16'></span> ";
          interval = 1;
        };
        "custom/gpu" = {
          format = "{}٪<span font='16'></span> ";
          exec = "cat /sys/class/drm/card0/device/gpu_busy_percent";
          interval = 5;
        };
        "custom/gpu-temp" = {
          format = "{}℃<span font='12'></span> ";
          exec = "cat /sys/class/drm/card0/device/hwmon/hwmon0/temp1_input | awk '{print $1/1000}'";
          interval = 5;
        };
        disk = {
          format = "{percentage_used}٪<span font='16'></span> ";
          path = "/";
          interval = 30;
        };
        memory = {
          format = "{}٪<span font='16'></span> ";
          interval = 1;
        };
        network = {
          format-wifi = " <span font='16'></span> ";
          format-ethernet = " <span font='17'>󰈀</span> ";
          format-linked = " <span font='16'>󱘖</span> {ifname} (No IP) ";
          format-disconnected = " <span font='16'>󱘖</span> Not connected ";
          tooltip-format = " {essid} {ipaddr}/{cidr} ";
        };
        pulseaudio = {
          format = " <span font='16'>{icon}</span>{volume}٪{format_source} ";
          format-bluetooth = " <span font='16'>{icon} </span>{volume}٪{format_source} ";
          format-bluetooth-muted = " <span font='16'>x </span>{volume}٪{format_source} ";
          format-muted = " <span font='16'>x </span>{volume}٪{format_source} ";
          format-source = "<span font='16'> </span> ";
          format-source-muted = " <span font='16'> </span> ";
          format-icons = {
            default = [" " " " " "];
            headphone = " ";
          };
          tooltip-format = "{desc}, {volume}٪";
          on-click = "${pkgs.pamixer}/bin/pamixer -t";
          on-click-right = "${pkgs.pamixer}/bin/pamixer --default-source -t";
          on-click-middle = "${pkgs.pavucontrol}/bin/pavucontrol";
        };
        "custom/power" = {
          format = " <span font='20'>⏻</span> ";
          on-click = "wlogout -p layer-shell";
          tooltip = false;
          interval = 86400;
        };
        "custom/spacer" = {
          format = " │ ";
        };
        tray = {
          icon-size = 20;
        };
      };
    };
  };
}
