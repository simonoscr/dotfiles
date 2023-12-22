{
  config,
  pkgs,
  ...
}: {
  services = {
    xserver = {
      enable = true;
      ## now defaults to "modesetting" driver over device-specific. other driver like "amdpgu", "nouveau" or "radeon" unmaintained: https://github.com/NixOS/nixpkgs/pull/218437
      #videoDrivers = [ "amdgpu" ];
      #libinput.enable = true;
    };
    greetd = {
      enable = true;
      settings = {
        default_session = {
          user = "simon";
          #command = "Hyprland";
          #command = "${pkgs.greetd.tuigreet}/bin/tuigreet -g LOGIN -t -r --cmd Hyprland";
          command = ''
            ${pkgs.greetd.tuigreet}/bin/tuigreet \
              -g LOGIN -t -r \
              --sessions ${config.services.xserver.displayManager.sessionData.desktops}/share/wayland-sessions \
              --xsessions ${config.services.xserver.displayManager.sessionData.desktops}/share/xsessions
          '';
        };
      };
    };
  };
}
