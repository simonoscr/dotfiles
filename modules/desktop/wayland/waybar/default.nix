{pkgs, ...}: {
  home.packages = with pkgs; [
    libappindicator-gtk3
    libnl
    libdbusmenu-gtk3
  ];

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
        modules-left = ["custom/launcher" "cpu" "memory" "custom/window-name"];
        modules-center = ["hyprland/workspaces"];
        modules-right = ["tray" "pulseaudio" "network" "bluetooth" "clock" "custom/power"];

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
        temperature = {
          thermal-zone = 0;
          critical-threshold = 80;
          format-critical = "<span color='#FF7724'></span> {temperatureC}°C";
          format = "<span color='#FF7724'></span>  {temperatureC}°C";
        };
        battery = {
          states = {
            warning = 25;
            critical = 15;
          };
          format = "<span color='#AAD94C'>{icon}</span>  {capacity}%";
          format-charging = "<span color='#AAD94C'></span> {capacity}%";
          format-full = "<span color='#AAD94C'></span>  full";
          format-plugged = "<span color='#AAD94C'></span>  {capacity}%";
          format-icons = ["" "" "" "" ""];
        };
        memory = {
          interval = 30;
          format-alt = "<span color='#92E7CB'></span> {}%";
          format = "<span color='#92E7CB'></span> {used:0.1f}GB";
          max-length = 10;
        };
        cpu = {
          interval = 10;
          format = "<span color='#FF7724'></span> {}%";
          max-length = 10;
          on-click = "";
        };
        disk = {
          format = "<span color='#F25056'>󰋊</span> {percentage_used}%";
          tooltip = true;
          interval = 30;
        };
        clock = {
          format = "<span color='#2EA2DB'></span> {:%I:%M}";
          format-alt = "<span color='#2EA2DB'></span> {:%A, %d %B %Y}";
          tooltip-format = "<tt>{calendar}</tt>";
        };
        network = {
          interface = "wlan0";
          format = "{ifname}";
          format-wifi = "<span color='#AAD94C'></span>  {essid}";
          format-ethernet = " Wired";
          format-disconnected = "<span color='#FAC536'></span>  Offline";
          tooltip-format = "{ifname}";
          tooltip-format-wifi = "<span color='#AAD94C'></span>  {essid} <span color='#C7C7C7'>|</span> <span color='#FAC536'>{signalStrength}%</span>";
          tooltip-format-ethernet = "{ifname} ";
          tooltip-format-disconnected = "Disconnected";
          on-click = "sh ~/.config/waybar/scripts/network.sh || killall rofi";
        };
        "custom/power-menu" = {
          format = "⏻";
          on-click = "sh ~/.config/waybar/scripts/powermenu.sh";
        };
        pulseaudio = {
          format = "<span color='#A282C7'>{icon}</span> {volume}%";
          format-bluetooth = " ";
          format-bluetooth-muted = " ";
          tooltip = false;
          format-muted = "󰖁";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "󰕾" ""];
          };
          on-click = "pavucontrol || killall pavucontrol";
        };
      };
    };
    style = ''
      /*
        --background: #0A0B11;
        --foreground: #e6e1cf;
        --black-bright: #0F1419;
        --red: #F25056;
        --green: #AAD94C;
        --yellow: #FAC536;
        --blue: #2EA2DB;
        --magenta: #A282C7;
        --purple: #CC24C9;
        --cyan: #92E7CB;
        --white: #f2f2f2;
        --gray: #C7C7C7;
        --orange: #FF7724;
      */

      * {
        font-family: "CaskaydiaCove Nerd Font", sans-serif;
        font-size: 13px;
      }

      window#waybar {
        background-color: #0A0B11;
        color: #f2f2f2;
      /*  border-bottom: 2px solid #FF7724;*/
      }

      window#waybar.hidden {
        opacity: 0.2;
      }

      #workspaces {
        background-color: #1f2530;
        border-radius: 0 8px 8px 0;
        margin-top: 5px;
        margin-bottom: 5px;
        padding-right: 5px;
      }

      #workspaces button {
        color: #FFFFFF;
        padding-left: 8px;
        padding-right: 8px;
      }

      #workspaces button.focused{
        color: #A282C7;
      }

      /*#workspaces button.active {
        color: #FF7724;
      }*/

      #workspaces button.urgent {
        background-color: #FF7724;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #mpd,
      #bluetooth,
      #custom-hyprPicker,
      #custom-launcher,
      #custom-power-menu {
        padding-left: 11px;
        padding-right: 11px;
      }

      #custom-launcher {
        background-color: #1f2530;
        border-radius: 8px 0 0 8px;
        margin-top: 5px;
        margin-bottom: 5px;
        margin-left: 8px;
        font-size: 17px;
        color: #2EA2DB;
        padding-left: 13px;
      }

      #custom-power-menu {
        background-color: #1f2530;
        border-radius: 0 8px 8px 0;
        margin-top: 5px;
        margin-bottom: 5px;
        margin-right: 8px;
        font-size: 17px;
        color: #F25056;
        padding-right: 16px;
      }

      #network {
        background-color: #1f2530;
        border-radius: 8px 0 0 8px;
        margin-top: 5px;
        margin-bottom: 5px;
      }

      #pulseaudio {
      /*  color: #A282C7;*/
        background-color: #1f2530;
        margin-top: 5px;
        margin-bottom: 5px;
      }

      #battery {
      /*  color: #AAD94C;*/
        background-color: #1f2530;
        margin-top: 5px;
        margin-bottom: 5px;
      }

      #backlight {
      /*  color: #FAC536;*/
        background-color: #1f2530;
        margin-top: 5px;
        margin-bottom: 5px;
      }

      #disk {
      /*  color: #F25056;*/
        background-color: #1f2530;
        margin-top: 5px;
        margin-bottom: 5px;
      }

      #cpu {
      /*  color: #FF7724;*/
        background-color: #1f2530;
        margin-top: 5px;
        margin-bottom: 5px;
        border-radius: 8px 0 0 8px;
      }

      #memory {
      /*  color: #92E7CB;*/
        background-color: #1f2530;
        margin-top: 5px;
        margin-bottom: 5px;
      }

      #clock {
      /*  color: #2EA2DB;*/
        background-color: #1f2530;
        margin-top: 5px;
        margin-bottom: 5px;
        border-radius: 0 8px 8px 0;
      }


      /* If workspaces is the leftmost module, omit left margin */
      .modules-left > widget:first-child > #workspaces {
        margin-left: 0;
      }

      /* If workspaces is the rightmost module, omit right margin */
      .modules-right > widget:last-child > #workspaces {
        margin-right: 0;
      }


      @keyframes blink {
        to {
      /*    background-color: rgba(30, 34, 42, 0.5);*/
          color: #F25056;
        }
      }

      /* #battery {
      }
      #battery.full {
      } */

      #battery.critical:not(.charging) {
        color: #F25056;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      label:focus {
        background-color: #000000;
      }

      #tray > .passive {
        -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background-color: #eb4d4b;
      }
    '';
  };
}
