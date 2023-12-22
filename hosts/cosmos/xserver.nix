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
          #command = "Hyprland"; # start Hyprland directly without a login manager
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland"; # start Hyprland with a TUI login manager
        };
      };
    };
  };
}
