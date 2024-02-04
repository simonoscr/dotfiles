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
    "custom/kernel"
    "cpu"
    "temperature#cpu"
    "custom/gpu"
    "temperature#gpu"
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
    #"custom/audio_device"
    "pulseaudio#microphone"
    "network#wlo"
    "network#enp"
    "idle_inhibitor"
    "custom/power"
  ];
in {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    #systemd = {
    #  enable = true;
    #  target = "hyprland-session.target";
    #};

    style = ''
      * {
        border: none;
        border-radius: 5px;
        font-family: FiraMono Nerd Font Propo;
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
      #clock,
      #window,
      #cpu,
      #custom-cpu,
      #custom-gpu,
      #disk,
      #tray,
      #memory,
      #temperature {
        color: #CCCCCC;
        background-clip: padding-box;
      }
      #memory.warning {
        color: #e66100;
      }
      #memory.critical {
        color: #c01c28;
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
      #custom-audio_device {
        color: #CCCCCC;
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
        height = 28;

        tray = {spacing = 12;};
        modules-left = modules-left;
        modules-right = modules-right;
        modules-center = modules-center;

        "custom/menu" = {
          format = "  ";
          on-click = "${pkgs.wofi}/bin/wofi --show drun";
          on-click-right = "${pkgs.wofi}/bin/wofi --show drun";
          tooltip = false;
        };
        "custom/kernel" = {
          interval = "once";
          format = "  {} ";
          exec = "uname -r";
        };
        "wlr/workspaces" = {
          format = " {name} ";
          active-only = false;
          on-click = "activate";
        };
        "hyprland/workspaces" = {
          format = " {icon} ";
          on-scroll-up = "hyprctl dispatch workspace r-1";
          on-scroll-down = "hyprctl dispatch workspace r+1";
          all-outputs = true;
          active-only = false;
          show-special = true;
          on-click = "activate";
          format-icons = {
            "urgent" = "";
            "active" = "";
            "default" = "";
          };
          tooltip-format = ''
            Workspace'';
        };
        "hyprland/submap" = {
          format = " {}";
          tooltip = false;
        };
        clock = {
          format = " {:%b %d %H:%M} ";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            on-scroll = 1;
            format = {
              months = "<span color='#2ec27e'><b>{}</b></span>";
              days = "<span color='#CCCCCC'><b>{}</b></span>";
              weekdays = "<span color='#CCCCCC'><b>{}</b></span>";
              today = "<span color='#2ec27e'><b><u>{}</u></b></span>";
            };
            actions = {
              on-click-right = "mode";
              on-click-forward = "tz_up";
              on-click-backward = "tz_down";
              on-scroll-up = "shift_up";
              on-scroll-down = "shift_down";
            };
          };
        };
        cpu = {
          format = "  {usage} ";
          interval = 5;
          states = {
            warning = 80;
            critical = 95;
          };
        };
        "temperature#cpu" = {
          format = " {icon} {temperatureC}°C ";
          hwmon-path = "/sys/class/hwmon/hwmon3/temp1_input";
          format-icons = ["" "" "" "" ""];
          critical-threshold = 90;
          tooltip = true;
        };
        "custom/gpu" = {
          format = " 󰘚 {} ";
          exec = "cat /sys/class/drm/card0/device/gpu_busy_percent";
          interval = 5;
        };
        "temperature#gpu" = {
          format = " {icon} {temperatureC}°C ";
          hwmon-path = "/sys/class/hwmon/hwmon0/temp1_input";
          format-icons = ["" "" "" "" ""];
          critical-threshold = 90;
          tooltip = true;
        };
        disk = {
          format = " 󰋊 {percentage_used} ";
          path = "/nix";
          interval = 30;
        };
        memory = {
          format = "  {} ";
          format-alt = "  {used:0.1f}G ";
          interval = 5;
          states = {
            warning = 85;
            critical = 95;
          };
        };
        "network#enp" = {
          interface = "enp*";
          interval = 3;
          format = " {ifname} ";
          format-ethernet = "󰈀 {ipaddr}/{cidr}";
          format-disconnected = "";
          tooltip-format = ''
            {ipaddr}/{cidr}
            Up: {bandwidthUpBits}
            Down: {bandwidthDownBits}'';
          tooltip-format-disconnected = "Disconnected";
        };
        "network#wlo" = {
          interface = "wlo*";
          interval = 3;
          format = " {ifname} ";
          format-wifi = " {essid}";
          format-disconnected = "";
          tooltip-format = ''
            {essid} ({signalStrength})
            {ipaddr}/{cidr}󰈀
            Up: {bandwidthUpBits}
            Down: {bandwidthDownBits}'';
          tooltip-format-disconnected = "Disconnected";
        };
        "pulseaudio#microphone" = {
          format = " {format_source} ";
          format-source = "";
          format-source-muted = " Muted";
          on-click = "${pkgs.pamixer}/bin/pamixer --default-source -t";
        };
        pulseaudio = {
          format = " {icon}{volume} ";
          format-muted = "x 0٪";
          ignored-sinks = ["Easy Effects Sink"];
          format-icons = {
            default = [" " " " " "];
            headphone = "󰋋 ";
            headset = "󰋎 ";
          };
          tooltip-format = "{desc}, {volume}٪";
          on-scroll-up = "${pkgs.pamixer}/bin/pamixer -i 5";
          on-scroll-down = "${pkgs.pamixer}/bin/pamixer -d 5";
          on-click = "${pkgs.pamixer}/bin/pamixer -t";
          on-click-middle = "${pkgs.pavucontrol}/bin/pavucontrol";
          on-click-right = "${pkgs.pulseaudio}/bin/pactl set-default-sink $(${pkgs.pulseaudio}/bin/pactl list sinks short | ${pkgs.gnugrep}/bin/grep -E 'Focusrite_Scarlett|SteelSeries_Arctis_Nova_Pro_Wireless' | ${pkgs.gnugrep}/bin/grep -v $(${pkgs.pulseaudio}/bin/pactl get-default-sink) | ${pkgs.gawk}/bin/awk 'NR==1{print $1} NR==2{exit}' || ${pkgs.pulseaudio}/bin/pactl list sinks short | ${pkgs.gnugrep}/bin/grep -E 'Focusrite_Scarlett|SteelSeries_Arctis_Nova_Pro_Wireless' | ${pkgs.gawk}/bin/awk 'NR==1{print $1}')";
        };
        #"custom/audio_device" = {
        #  exec = "${config.home.homeDirectory}/.config/waybar/scripts/dynamic-audio-icon.sh";
        #  interval = 5;
        #  on-click = "pavucontrol";
        #};
        "custom/power" = {
          format = " ⏻ ";
          on-click = "wlogout -p layer-shell";
          tooltip = false;
          interval = 86400;
        };
        idle_inhibitor = {
          format = " {icon} ";
          format-icons = {
            activated = "󰈈";
            deactivated = "󰈉";
          };
        };
        "custom/spacer" = {
          format = " │ ";
        };
        tray = {
          icon-size = 16;
          show-passive-items = true;
        };
      };
    };
  };
  home.file = {
    ".config/waybar/scripts".source = ./scripts;
  };
}
