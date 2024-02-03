{
  config,
  default,
  pkgs,
  ...
}: {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      color = "171717";
      font-size = 24;
      indicator-idle-visible = false;
      indicator-radius = 100;
      line-color = "00D787";
      show-failed-attempts = true;
      clock = true;
    };
  };
}
