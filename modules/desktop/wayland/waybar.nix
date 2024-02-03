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
    "hyprland/workspaces"
    "custom/spacer"
    "cpu"
    "custom/gpu"
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

  sinkBuiltIn = "Built-in Audio Analog Stereo";
  sinkBluetooth = "Bluetooth Speaker";
  headset = sinkBuiltIn;
  speaker = sinkBluetooth;
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
        border: 1px solid #2ec27e;
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
      #pulseaudio,
      #custom-sink,
      #network,
      #mpd,
      #memory,
      #network,
      #window,
      #cpu,
      #custom-cpu,
      #custom-gpu,
      #disk,
      #tray {
        color: #CCCCCC;
        background-clip: padding-box;
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
        color: rgba(255,255,255,0.8);
      }
      #workspaces button:hover {
        background-color: rgba(0,0,0,0.2);
      }
      /*#workspaces button.focused {*/
      #workspaces button.active {
        color: rgba(255,255,255,0.8);
        background-color: rgba(80,100,100,0.4);
      }
      #workspaces button.visible {
        color: #ccffff;
      }
      #workspaces button.hidden {
        color: #999999;
      }
    '';
    settings = {
      Main = {
        layer = "top";
        position = "top";
        height = 16;

        tray = {spacing = 8;};
        modules-left = modules-left;
        modules-right = modules-right;
        modules-center = modules-center;

        "custom/menu" = {
          format = " <span font='24'></span> ";
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
            active = "<span font='16'></span>";
            default = "<span font='16'></span>";
          };
        };
        clock = {
          format = " {:%b %d %H:%M} ";
          #on-click = "${pkgs.eww-wayland}/bin/eww open --toggle calendar --screen 0";
        };
        cpu = {
          format = " {usage}%<span font='16'> </span> ";
          interval = 1;
        };
        "custom/gpu" = {
          format = " {}%<span font='14'> 󰒋</span> ";
          exec = "cat /sys/class/drm/card0/device/gpu_busy_percent";
          interval = 5;
        };
        disk = {
          format = " {percentage_used}%<span font='16'> </span> ";
          path = "/";
          interval = 30;
        };
        memory = {
          format = " {}%<span font='16'> </span> ";
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
          format = " <span font='16'>{icon}</span>{volume}%{format_source} ";
          format-bluetooth = " <span font='16'>{icon} </span>{volume}%{format_source} ";
          format-bluetooth-muted = " <span font='16'>x </span>{volume}%{format_source} ";
          format-muted = " <span font='16'>x </span>{volume}%{format_source} ";
          format-source = "<span font='16'> </span> ";
          format-source-muted = " <span font='16'> </span> ";
          format-icons = {
            default = [" " " " " "];
            headphone = " ";
          };
          tooltip-format = "{desc}, {volume}%";
          on-click = "${pkgs.pamixer}/bin/pamixer -t";
          on-click-right = "${pkgs.pamixer}/bin/pamixer --default-source -t";
          on-click-middle = "${pkgs.pavucontrol}/bin/pavucontrol";
        };
        "custom/sink" = {
          format = " {} ";
          exec = "$HOME/.config/waybar/script/sink.sh";
          interval = 2;
          on-click = "$HOME/.config/waybar/script/switch.sh";
          tooltip = false;
        };
        "custom/power" = {
          format = " <span font='18'>⏻</span> ";
          on-click = "wlogout -p layer-shell";
          tooltip = false;
          interval = 86400;
        };
        "custom/spacer" = {
          format = "  ";
        };
        tray = {
          icon-size = 18;
        };
      };
    };
  };
  home.file = {
    ".config/waybar/script/sink.sh" = {
      text = ''
        #!/bin/sh

        HEAD=$(awk '/ ${headset}/ { print $2 }' <(${pkgs.wireplumber}/bin/wpctl status | grep "*") | head -n 1)
        SPEAK=$(awk '/ ${speaker}/ { print $2 }' <(${pkgs.wireplumber}/bin/wpctl status | grep "*") | head -n 1)

        if [[ $SPEAK = "*" ]]; then
          printf "<span font='16'>󰓃</span>\n"
        elif [[ $HEAD = "*" ]]; then
          printf "<span font='16'></span>\n"
        fi
        exit 0
      '';
      executable = true;
    };
    ".config/waybar/script/switch.sh" = {
      text = ''
        #!/bin/sh

        ID1=$(awk '/ ${headset}/ {sub(/.$/,"",$2); print $2 }' <(${pkgs.wireplumber}/bin/wpctl status) | head -n 1)
        ID2=$(awk '/ ${speaker}/ {sub(/.$/,"",$2); print $2 }' <(${pkgs.wireplumber}/bin/wpctl status) | sed -n 2p)

        HEAD=$(awk '/ ${headset}/ { print $2 }' <(${pkgs.wireplumber}/bin/wpctl status | grep "*") | head -n 1)
        SPEAK=$(awk '/ ${speaker}/ { print $2 }' <(${pkgs.wireplumber}/bin/wpctl status | grep "*") | head -n 1)

        if [[ $SPEAK = "*" ]]; then
          ${pkgs.wireplumber}/bin/wpctl set-default $ID1
        elif [[ $HEAD = "*" ]]; then
          ${pkgs.wireplumber}/bin/wpctl set-default $ID2
        fi
        exit 0
      '';
      executable = true;
    };
  };
}
