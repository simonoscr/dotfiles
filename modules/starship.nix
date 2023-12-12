{ config, ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;

      kubernetes = {
        disabled = false;
      };
    };
  };
}
