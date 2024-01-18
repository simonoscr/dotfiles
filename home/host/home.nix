{pkgs, ...}: {
  imports = [
    ../../modules/shell/cli.nix
    ../../modules/fonts.nix
    ../../modules/git.nix
    ../../modules/terminals/kitty.nix
    ../../modules/editors/neovim.nix
    ../../modules/shell/starship.nix
    ../../modules/shell/zsh.nix
  ];

  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = ["nix-command" "flakes"];
    };
  };

  programs.home-manager.enable = true;

  home = {
    username = "host";
    homeDirectory = "/home/host";
    sessionVariables = {
      SHELL = "${pkgs.zsh}/bin/zsh";
    };
  };

  ## reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.11";
}
