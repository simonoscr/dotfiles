 { config, pkgs, ... }:
{

  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
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
