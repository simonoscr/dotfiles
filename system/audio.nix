{
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.nix-gaming.nixosModules.pipewireLowLatency];

  sound.enable = true;
  hardware.pulseaudio.enable = lib.mkForce false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
    lowLatency = {
      enable = true;
      quantum = 64;
      rate = 44100;
    };
    extraConfig.pipewire = {
      "92-low-latency" = {
        "context.properties" = {
          "default.clock.rate" = 44100;
          "default.clock.allowed-rates" = [44100];
          "default.clock.quantum" = 64;
          "default.clock.min-quantum" = 64;
          "default.clock.max-quantum" = 64;
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    pavucontrol
    playerctl
    pulsemixer
    easyeffects
    pamixer
    alsa-scarlett-gui
  ];
}
