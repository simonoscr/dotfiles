{
  self,
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];

  home.packages = with pkgs; [
    sassc
    gnome.gnome-bluetooth
    gtksourceview
    brightnessctl
    (python311.withPackages (p: [p.python-pam]))
  ];

  programs.ags = {
    enable = true;
    configDir = ./style1;
    extraPackages = [pkgs.libsoup_3];
  };
}
