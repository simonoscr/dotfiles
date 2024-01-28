{pkgs, ...}: {
  imports = [
    ../../modules/git.nix
    ../../modules/shell/zsh.nix
  ];

  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
}
