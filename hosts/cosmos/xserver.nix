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
      displayManager = {
        defaultSession = "hyprland";
        autoLogin = {
          enable = true;
          user = "simon";
        };
      };
    };
  };
}
