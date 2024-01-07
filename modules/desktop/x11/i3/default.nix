{
  pkgs,
  home-manager,
  ...
}: {
  imports = [
    #./config.nix
  ];
  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
    };
  };
  fonts.fontconfig.enable = true;
}
