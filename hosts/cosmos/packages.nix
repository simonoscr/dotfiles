{ pkgs, config, lib, ... }:
{

  environment.systemPackages = with pkgs; [
    git
    neovim
    linuxPackages.cpupower
    btop
    bat
    curl
  ];

  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraEnv = {};
      extraPkgs = pkgs: with pkgs; [
        gamescope
      ];
      extraLibraries = pkgs: with pkgs; [
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils
      ];
    };
  };
}
