{ pkgs, config, ... }:
{

  fonts = {
    fontconfig= {
      enable = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
      };
      antialias = true;
      cache32Bit = true;
      hinting.enable = true;
      hinting.autohint = true;
    };
    fontDir.enable = true;
    packages = with pkgs; [
      liberation_ttf
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "JetBrainsMono"
          "LiberationMono"
        ];
      })
      noto-fonts
      roboto
    ];
  };
}
