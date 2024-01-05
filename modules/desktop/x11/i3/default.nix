{pkgs, ...}: {
  imports = [
    ./config.nix
  ];
  xsession.windowManager.i3 = {
    enable = true;
  };
}
