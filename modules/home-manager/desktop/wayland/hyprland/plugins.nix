{
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [inputs.hyprland-plugins.packages.${pkgs.system}.csgo-vulkan-fix];
    #settings = {
    #  "plugin:csgo-vulkan-fix" = {
    #    res_w = 1920;
    #    res_h = 1440;
    #    class = "cs2";
    #  };
    #};
    extraConfig = ''
      plugin {
        csgo-vulkan-fix {
          res_w = 1920
          res_h = 1440
          class = cs2
        }
      }
    '';
  };
}
