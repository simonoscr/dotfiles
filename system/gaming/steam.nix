{pkgs, ...}: {
  programs = {
    steam = {
      enable = true;
      #gamescopeSession.enable = true;
      #package = pkgs.steam.override {
      #  extraPkgs = pkgs:
      #    with pkgs; [
      #      gamemode
      #    ];
      #  extraLibraries = pkgs:
      #    with pkgs; [
      #      xorg.libXcursor
      #      xorg.libXi
      #      xorg.libXinerama
      #      xorg.libXScrnSaver
      #      libpng
      #      libpulseaudio
      #      libvorbis
      #      stdenv.cc.cc.lib
      #      libkrb5
      #      keyutils
      #    ];
      #};
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}
