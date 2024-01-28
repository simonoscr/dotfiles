{pkgs, ...}: {
  imports = [
    ../../modules/git.nix
    ../../modules/terminals/kitty.nix
    ../../modules/editors/neovim.nix
    ../../modules/shell/starship.nix
    ../../modules/shell/zsh.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "oscar";
    homeDirectory = "/home/oscar";
    sessionVariables = {
      SHELL = "${pkgs.zsh}/bin/zsh";
    };
  };

  home.stateVersion = "23.11";
}
